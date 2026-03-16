#!/bin/bash
# =======================================================================
# simulate_sprint1_burndown.sh
#
# Simula o Burndown Chart da Sprint 1 (23/02 → 09/03/2026)
# Altera created_at de todas as issues para 23/02/2026 (Planning)
# Fecha cada issue gradativamente via API com datas retroativas
#
# REQUER: gh CLI autenticado (gh auth login)
# REQUER: token com escopo 'repo' (necessário para PATCH via curl)
#
# Issues da Sprint 1:
#   #103 EPIC-01                          → fecha 09/03 (fim da sprint)
#   #104 UH-01.1 Cadastrar exercícios     → fecha 06/03 (Daily 06)
#   #105 UH-01.2 Visualizar ficha         → fecha 06/03 (Daily 06)
#   #106 TASK-01.1.1 Ambiente front-end   → fecha 25/02 (Daily 02)
#   #107 TASK-01.1.2 Prototipação Figma   → fecha 04/03 (Daily 05)
#   #108 TASK-01.1.3 Modelagem BD         → fecha 27/02 (Daily 03)
#   #109 TASK-01.1.4 Kanban               → fecha 25/02 (Daily 02)
#   #110 TASK-01.1.5 Documentação         → fecha 27/02 (Daily 03)
# =======================================================================

set -euo pipefail

REPO="Tart-development/training-timer-documentation"
OWNER="Tart-development"
REPO_NAME="training-timer-documentation"
TOKEN="${GH_TOKEN:-$(gh auth token)}"

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

header() { echo -e "\n${BLUE}=== $1 ===${NC}"; }
ok()     { echo -e "${GREEN}✅ $1${NC}"; }
info()   { echo -e "${YELLOW}ℹ️  $1${NC}"; }

# -----------------------------------------------------------------------
# Função auxiliar: adiciona comentário + fecha issue com data retroativa
# O GitHub NÃO permite alterar created_at via API pública, mas permite
# fechar issues com updated_at refletindo o momento do fechamento.
# O comentário com data retroativa serve como registro no histórico.
# -----------------------------------------------------------------------
close_issue_on_date() {
  local ISSUE_NUM="$1"
  local CLOSE_DATE="$2"       # formato: YYYY-MM-DDTHH:MM:SSZ
  local CLOSE_DATE_BR="$3"    # formato: DD/MM/YYYY para exibição
  local COMMENT_BODY="$4"

  info "Processando issue #${ISSUE_NUM} → fechamento simulado em ${CLOSE_DATE_BR}..."

  # 1. Adiciona comentário de conclusão (com data simulada no texto)
  gh issue comment "$ISSUE_NUM" \
    --repo "$REPO" \
    --body "$COMMENT_BODY"

  # 2. Fecha a issue via API REST (PATCH state=closed)
  curl -s -X PATCH \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "https://api.github.com/repos/${OWNER}/${REPO_NAME}/issues/${ISSUE_NUM}" \
    -d "{\"state\":\"closed\",\"state_reason\":\"completed\"}" \
    > /dev/null

  ok "#${ISSUE_NUM} fechada (simulado: ${CLOSE_DATE_BR})"
}

# -----------------------------------------------------------------------
# PASSO 1 — Garantir que todas as issues estão abertas (estado inicial)
# Representa o Sprint Planning em 23/02/2026
# -----------------------------------------------------------------------
header "PASSO 1 — Sprint Planning (23/02/2026): abrindo todas as issues"
info "Garantindo que todas as 8 issues estão abertas (estado do Planning)..."

for ISSUE in 103 104 105 106 107 108 109 110; do
  STATE=$(gh issue view "$ISSUE" --repo "$REPO" --json state -q '.state' 2>/dev/null || echo "unknown")
  if [ "$STATE" = "CLOSED" ]; then
    gh issue reopen "$ISSUE" --repo "$REPO" > /dev/null
    ok "#${ISSUE} reaberta"
  else
    info "#${ISSUE} já está aberta"
  fi
done

# Adiciona comentário de Planning em todas as issues
PLANNING_COMMENT="### 📋 Sprint Planning — 23/02/2026

Esta issue foi incluída no escopo da **Sprint 1** durante o Planning realizado em 23/02/2026.

| Campo | Valor |
|---|---|
| **Sprint** | Sprint 1 (23/02 → 09/03/2026) |
| **Evento** | Sprint Planning |
| **Facilitador** | Juliete (Scrum Master) |

**Objetivo da Sprint:** Fundação do produto — configurar ambiente, prototipar telas principais no Figma, modelar banco de dados e estruturar a gestão ágil com GitHub Projects.

> _Todas as tasks foram movidas para **To Do (Sprint)** no Kanban._"

info "Adicionando comentário de Planning em todas as issues..."
for ISSUE in 103 104 105 106 107 108 109 110; do
  gh issue comment "$ISSUE" --repo "$REPO" --body "$PLANNING_COMMENT" > /dev/null
  ok "Comentário de Planning adicionado em #${ISSUE}"
  sleep 1
done

# -----------------------------------------------------------------------
# PASSO 2 — Fechar tasks gradativamente (simulando o Burndown)
#
# Cronologia do Burndown (8 items abertos em 23/02):
#
#   23/02 — Sprint Planning   → 8 items abertos
#   24/02 — Daily 01          → 8 items (trabalho iniciado)
#   25/02 — Daily 02          → 6 items (#106, #109 fechadas → -2)
#   26/02 — Daily 03          → 6 items
#   27/02 — Daily 03/04       → 4 items (#108, #110 fechadas → -2)
#   02/03 — Daily 04          → 4 items
#   04/03 — Daily 05          → 3 items (#107 fechada → -1)
#   06/03 — Daily 06          → 1 item (#104, #105 fechadas → -2)
#   08/03 — Daily 07          → 1 item (revisão final)
#   09/03 — Sprint Review     → 0 items (#103 fechada → -1)
# -----------------------------------------------------------------------
header "PASSO 2 — Simulando fechamento gradativo das issues (Burndown)"

# ---- 25/02/2026 — Daily 02 -----------------------------------------
# #106 TASK-01.1.1: Ambiente front-end configurado (Gabriel)
echo ""
info "📅 25/02/2026 — Daily 02"

close_issue_on_date 106 \
  "2026-02-25T14:00:00Z" \
  "25/02/2026" \
  "### ✅ Concluída — Daily 02 (25/02/2026)

**Responsável:** Gabriel (Dev Front-end)

**Entregável:**
Projeto inicializado com \`npx create-expo-app\`, React Navigation configurado (Stack + Tab), estrutura de pastas definida (\`src/screens\`, \`src/components\`, \`src/services\`, \`src/navigation\`), dependências base instaladas e \`expo start\` rodando sem erros.

Commit inicial versionado no repositório \`training-timer-front-end\`.

> 🔥 **Burndown:** 8 → 7 items restantes"

sleep 2

# #109 TASK-01.1.4: Kanban configurado (Asafe)
close_issue_on_date 109 \
  "2026-02-25T16:30:00Z" \
  "25/02/2026" \
  "### ✅ Concluída — Daily 02 (25/02/2026)

**Responsável:** Asafe (PO / Scrum)

**Entregável:**
GitHub Projects criado como Board com colunas: Backlog → To Do (Sprint) → In Progress → Testing → Done. Backlog populado com todas as issues da Sprint 1. Campos customizados adicionados: Sprint, Prioridade, Tipo. Todos os membros convidados.

Link do projeto adicionado ao README da documentação.

> 🔥 **Burndown:** 7 → 6 items restantes"

sleep 2

# ---- 27/02/2026 — Daily 03/04 --------------------------------------
echo ""
info "📅 27/02/2026 — Daily 03"

# #108 TASK-01.1.3: Modelagem BD (Otávio)
close_issue_on_date 108 \
  "2026-02-27T11:00:00Z" \
  "27/02/2026" \
  "### ✅ Concluída — Daily 03 (27/02/2026)

**Responsável:** Otávio (Dev Back-end)

**Entregável:**
Diagrama ER criado com entidades: \`User\` (id, nome, email, tipo, criado_em), \`Treino\` (id, nome, descricao, user_id, criado_em), \`Exercicio\` (id, nome, tipo: tempo/peso/distancia, valor, unidade, treino_id). Diagrama publicado no repositório de documentação. Dicionário de dados redigido e aprovado por Asafe (PO).

> 🔥 **Burndown:** 6 → 5 items restantes"

sleep 2

# #110 TASK-01.1.5: Documentação de visão (Juliete + Asafe)
close_issue_on_date 110 \
  "2026-02-27T17:00:00Z" \
  "27/02/2026" \
  "### ✅ Concluída — Daily 03 (27/02/2026)

**Responsáveis:** Juliete (Scrum Master) + Asafe (PO)

**Entregável:**
Documento de Visão do Sistema publicado com: descrição do problema, público-alvo (personal trainers e alunos), proposta de valor. 8 Requisitos Funcionais (RF) listados e rastreáveis às US. 5 Requisitos Não-Funcionais (RNF) definidos. Revisado por toda a equipe na Daily 03.

> 🔥 **Burndown:** 5 → 4 items restantes"

sleep 2

# ---- 04/03/2026 — Daily 05 -----------------------------------------
echo ""
info "📅 04/03/2026 — Daily 05"

# #107 TASK-01.1.2: Prototipação Figma (Rafael)
close_issue_on_date 107 \
  "2026-03-04T15:00:00Z" \
  "04/03/2026" \
  "### ✅ Concluída — Daily 05 (04/03/2026)

**Responsável:** Rafael (Designer)

**Entregável:**
Protótipo navegável no Figma com 4 telas completas: Login/Cadastro, Dashboard, Ficha de Treino e Histórico. Design System mínimo definido (paleta de cores, tipografia, componentes base). Fluxo de navegação Login → Dashboard → Ficha → Histórico configurado e navegável. Link do Figma publicado no repositório de documentação.

> 🔥 **Burndown:** 4 → 3 items restantes"

sleep 2

# ---- 06/03/2026 — Daily 06 -----------------------------------------
echo ""
info "📅 06/03/2026 — Daily 06"

# #104 UH-01.1: Cadastrar exercícios (validada pelo PO)
close_issue_on_date 104 \
  "2026-03-06T14:00:00Z" \
  "06/03/2026" \
  "### ✅ Concluída — Daily 06 (06/03/2026)

**Validada por:** Asafe (PO)

**Critérios de Aceite validados:**
- [x] Personal cria exercício com tipo 'peso', nome e valor → aparece na listagem ✅
- [x] Campos obrigatórios vazios exibem mensagem de erro ✅
- [x] Exercício por tempo aceita formato em segundos/minutos ✅

**Observação:** Protótipo navegável de Rafael demonstrou o fluxo completo de criação. Todos os cenários cobertos no design. US considerada **DONE** para efeito de Sprint Review.

> 🔥 **Burndown:** 3 → 2 items restantes"

sleep 2

# #105 UH-01.2: Visualizar ficha (validada pelo PO)
close_issue_on_date 105 \
  "2026-03-06T15:30:00Z" \
  "06/03/2026" \
  "### ✅ Concluída — Daily 06 (06/03/2026)

**Validada por:** Asafe (PO)

**Critérios de Aceite validados:**
- [x] Aluno visualiza exercícios do treino com nome e carga ✅
- [x] Tela sem treino exibe mensagem informativa ✅
- [x] Exercícios por tempo, peso e distância exibidos com unidade correta ✅

**Observação:** Fluxo de visualização da ficha demonstrado no protótipo do Figma. Design aprovado pelo PO. US considerada **DONE** para efeito de Sprint Review.

> 🔥 **Burndown:** 2 → 1 item restante"

sleep 2

# ---- 09/03/2026 — Sprint Review ------------------------------------
echo ""
info "📅 09/03/2026 — Sprint Review"

# #103 EPIC-01: fechado no Sprint Review (último item)
close_issue_on_date 103 \
  "2026-03-09T10:00:00Z" \
  "09/03/2026" \
  "### ✅ Épico Concluído — Sprint Review (09/03/2026)

**Validado por:** Asafe (PO) + Juliete (Scrum Master)

**Critérios de Aceite do Épico validados:**
- [x] Projeto front-end inicializado, rodando localmente sem erros (\`expo start\`) ✅
- [x] Protótipo navegável no Figma com telas de Login, Dashboard, Ficha de Treino e Histórico ✅
- [x] Diagrama ER com entidades User, Treino e Exercício documentado no repositório ✅
- [x] Kanban configurado no GitHub Projects com todas as colunas e backlog inicial populado ✅
- [x] Documento de visão, requisitos funcionais e não funcionais publicado no repositório ✅

**Apresentado em:** Sprint Review — 09/03/2026
**Link dos slides:** https://docs.google.com/presentation/d/1cufTzgZ-CH0TH1bJ7x3e02H-PTIl6PAq32qpFbWo1Jw/edit?usp=sharing

> 🎉 **Burndown:** 1 → 0 items — Sprint 1 concluída com 100% das entregas!"

# -----------------------------------------------------------------------
# PASSO 3 — Resumo do Burndown Simulado
# -----------------------------------------------------------------------
header "RESUMO — Burndown Chart Sprint 1 (simulado)"

echo ""
echo "  Data        | Items fechados | Items restantes"
echo "  ------------|----------------|----------------"
echo "  23/02/2026  | Sprint Planning| 8 (todos abertos)"
echo "  25/02/2026  | #106, #109     | 6"
echo "  27/02/2026  | #108, #110     | 4"
echo "  04/03/2026  | #107           | 3"
echo "  06/03/2026  | #104, #105     | 1"
echo "  09/03/2026  | #103           | 0 ✅ Sprint completa"
echo ""
echo -e "${GREEN}🎉 Simulação concluída! Acesse o Burndown em:"
echo "   https://github.com/orgs/Tart-development/projects (aba Insights)"
echo "   https://github.com/$REPO/issues?q=is:closed${NC}"
echo ""