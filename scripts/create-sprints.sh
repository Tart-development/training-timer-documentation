#!/bin/bash

# ============================================================
# Training Timer — Criação automática de issues das 3 sprints
# Repositório: Tart-development/training-timer-documentation
# Pré-requisito: gh CLI instalado e autenticado
# Uso: chmod +x create_issues.sh && ./create_issues.sh
# ============================================================

REPO="Tart-development/training-timer-documentation"

echo "🚀 Criando issues do Training Timer no repositório $REPO..."
echo ""

# ============================================================
# LABELS — garante que existem antes de criar os issues
# ============================================================
echo "🏷️  Criando labels..."
gh label create "Sprint"        --color "#0075ca" --description "Sprint Planning & Review" --repo "$REPO" 2>/dev/null || true
gh label create "Daily"         --color "#e4e669" --description "Daily Scrum"              --repo "$REPO" 2>/dev/null || true
gh label create "Retrospective" --color "#d93f0b" --description "Sprint Retrospective"     --repo "$REPO" 2>/dev/null || true
echo "✅ Labels prontos."
echo ""

# ============================================================
# SPRINT 1 — 23/02 a 09/03/2026
# ============================================================
echo "📌 Criando issues da Sprint 1..."

gh issue create --repo "$REPO" \
  --title "[SPRINT-01]: Planejamento e Review" \
  --label "Sprint" \
  --body "## Planejamento (Planning)

**Objetivo da Sprint:** Épico 01 — Fundação do Produto. Prototipação das telas principais no Figma, configuração do ambiente de desenvolvimento e modelagem inicial do banco de dados.

### Itens Priorizados:
- [x] [US-01.1]: Como personal trainer, quero cadastrar exercícios (por tempo, peso ou distância) para meus alunos
- [x] [US-01.2]: Como aluno, quero visualizar minha ficha de treino digital
- [x] [TASK]: Configuração do ambiente front-end — Gabriel
- [x] [TASK]: Prototipação das telas principais no Figma — Rafael
- [x] [TASK]: Modelagem inicial do BD (Entidades: User, Treino, Exercício) — Otávio
- [x] [TASK]: Configuração do Kanban + backlog no GitHub Projects — Asafe
- [x] [TASK]: Documentação de visão + requisitos funcionais/não-funcionais — Juliete + Asafe

---

## Entrega (Review)
**O que foi desenvolvido?** Protótipo navegável (Figma) com telas de Login, Dashboard, Ficha de Treino e Histórico. Modelagem inicial do banco de dados. Documentação de requisitos. Kanban configurado.

**Link dos Slides:** [Slides Sprint 1 — a publicar]

**Métricas (Burndown):** 7 tasks planejadas — 7/7 concluídas. Progresso linear sem bloqueios críticos."

echo "✅ [SPRINT-01] Planning & Review criado."

# -------- DAILIES SPRINT 1 --------

gh issue create --repo "$REPO" \
  --title "[DAILY-01.01]: 24/02/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Início de sprint. Hoje: Iniciar wireframes de Login e Dashboard no Figma. Impedimento: Nenhum.
* **Gabriel:** Ontem: Início de sprint. Hoje: Configurar ambiente Expo/React Native, revisar requisitos técnicos. Impedimento: Nenhum.
* **Otávio:** Ontem: Início de sprint. Hoje: Definir entidades principais do banco (User, Exercício, Treino). Impedimento: Nenhum.
* **Asafe:** Ontem: Início de sprint. Hoje: Configurar Kanban no GitHub Projects, detalhar User Stories. Impedimento: Nenhum.
* **Juliete:** Ontem: Início de sprint. Hoje: Facilitar daily, garantir alinhamento da equipe. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Nenhum impedimento registrado. Equipe alinhada ao objetivo da Sprint 1."
echo "✅ [DAILY-01.01] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-01.02]: 26/02/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Wireframes de Login e Dashboard iniciados. Hoje: Avançar na tela de Ficha de Treino (campos por tempo/peso/distância). Impedimento: Nenhum.
* **Gabriel:** Ontem: Ambiente configurado, projeto inicializado. Hoje: Estruturar navegação (React Navigation) e criar tela de Login provisória. Impedimento: Dúvida sobre biblioteca de ícones — resolvido com Asafe (decisão: @expo/vector-icons).
* **Otávio:** Ontem: Esboçou entidades User e Exercício. Hoje: Definir relacionamentos (User → Treino → Exercício), iniciar diagrama ER. Impedimento: Nenhum.
* **Asafe:** Ontem: Kanban configurado no GitHub Projects. Hoje: Refinar critérios de aceite de US-01.1 e US-01.2. Impedimento: Nenhum.
* **Juliete:** Ontem: Facilitou Daily 01. Hoje: Revisar documentação de visão do sistema. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Decisão: Biblioteca de ícones definida como @expo/vector-icons.
- Otávio compartilhou esboço do diagrama ER — aprovado pelo PO."
echo "✅ [DAILY-01.02] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-01.03]: 27/02/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Tela de Ficha de Treino esboçada. Hoje: Prototipar tela de Histórico de treinos e tela de metas. Impedimento: Nenhum.
* **Gabriel:** Ontem: Navegação básica implementada. Hoje: Construir componente de card de exercício. Impedimento: Nenhum.
* **Otávio:** Ontem: Diagrama ER esboçado (User → Treino → Exercício). Hoje: Adicionar entidade Meta ao modelo e definir tipos de exercício (tempo/peso/distância). Impedimento: Nenhum.
* **Asafe:** Ontem: Refinou critérios de aceite. Hoje: Validar com a equipe se US-01.1 está suficientemente detalhada para implementação. Impedimento: Nenhum.
* **Juliete:** Ontem: Revisou documentação inicial. Hoje: Estruturar diário de bordo da sprint no repo de documentação. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Asafe alinhado com Gabriel sobre granularidade das tasks de front-end.
- Rafael compartilhou tela de Histórico para feedback — equipe sugeriu incluir filtro por data."
echo "✅ [DAILY-01.03] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-01.04]: 02/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Telas de Histórico e Metas prototipadas. Hoje: Prototipar tela de Login e fluxo de autenticação. Impedimento: Nenhum.
* **Gabriel:** Ontem: Componente de card de exercício criado. Hoje: Montar tela de listagem de exercícios (consumindo dados mockados). Impedimento: Nenhum.
* **Otávio:** Ontem: Entidade Meta adicionada ao modelo. Hoje: Definir campos detalhados de cada tabela e começar script de criação do BD. Impedimento: Nenhum.
* **Asafe:** Ontem: US-01.1 validada. Hoje: Detalhar US-01.2 (visualização de ficha) e priorizar itens para próxima sprint no backlog. Impedimento: Nenhum.
* **Juliete:** Ontem: Estruturou diário de bordo. Hoje: Atualizar Kanban (mover tasks concluídas para Done). Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Filtro por data na tela de histórico adicionado ao backlog como melhoria (próxima sprint).
- Kanban atualizado: 4 tasks em Done, 3 ainda In Progress."
echo "✅ [DAILY-01.04] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-01.05]: 04/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Fluxo de autenticação prototipado. Hoje: Revisar protótipo completo, ajustar consistência visual (cores, tipografia). Impedimento: Nenhum.
* **Gabriel:** Ontem: Tela de listagem de exercícios montada com dados mockados. Hoje: Iniciar integração com futuro endpoint (estrutura de chamada API). Impedimento: Nenhum.
* **Otávio:** Ontem: Script de criação das tabelas iniciado. Hoje: Finalizar script e revisar com Asafe a modelagem. Impedimento: Nenhum.
* **Asafe:** Ontem: US-01.2 detalhada. Hoje: Revisar modelagem de banco com Otávio, validar se cobre todos os requisitos funcionais. Impedimento: Nenhum.
* **Juliete:** Ontem: Kanban atualizado. Hoje: Preparar pauta para Sprint Review. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Modelagem aprovada por Asafe após revisão com Otávio.
- Gabriel e Otávio alinharam contrato de API (endpoints esperados) para próxima sprint."
echo "✅ [DAILY-01.05] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-01.06]: 06/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Revisão de consistência visual concluída. Hoje: Exportar protótipo final do Figma e documentar fluxos de navegação. Impedimento: Nenhum.
* **Gabriel:** Ontem: Estrutura de chamada API preparada. Hoje: Ajustar tela de Login para refletir protótipo final do Rafael. Impedimento: Nenhum.
* **Otávio:** Ontem: Script de BD finalizado. Hoje: Documentar o modelo de banco (dicionário de dados) no repo de documentação. Impedimento: Nenhum.
* **Asafe:** Ontem: Modelagem validada. Hoje: Preparar slides do Sprint Review e atualizar backlog com refinamentos. Impedimento: Nenhum.
* **Juliete:** Ontem: Pauta do Review preparada. Hoje: Garantir que todos os artefatos estejam prontos para o Review. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Nenhum impedimento. Sprint praticamente concluída.
- Decisão: Otávio documentará modelo de BD antes do Review."
echo "✅ [DAILY-01.06] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-01.07]: 08/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Protótipo exportado e documentado. Hoje: Revisar feedback final, ajustar detalhe de cor no tema dark. Impedimento: Nenhum.
* **Gabriel:** Ontem: Tela de Login ajustada. Hoje: Revisar código, garantir que tudo que foi desenvolvido está limpo para Review. Impedimento: Nenhum.
* **Otávio:** Ontem: Dicionário de dados documentado. Hoje: Revisar documentação do banco e preparar para apresentação. Impedimento: Nenhum.
* **Asafe:** Ontem: Slides preparados e backlog atualizado. Hoje: Ensaiar Review com equipe, validar critérios de aceite das US. Impedimento: Nenhum.
* **Juliete:** Ontem: Artefatos revisados. Hoje: Facilitar o Review e a Retrospective amanhã. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Sprint 1 concluída. Todos os critérios de aceite de US-01.1 e US-01.2 validados.
- Kanban: todas as tasks movidas para Done."
echo "✅ [DAILY-01.07] criado."

gh issue create --repo "$REPO" \
  --title "[RETRO-01]: Sprint 01" \
  --label "Retrospective" \
  --body "### O que funcionou bem?
- Comunicação fluida entre designer (Rafael) e dev front-end (Gabriel) desde o início.
- Protótipo entregue com qualidade e dentro do prazo.
- Modelagem de banco de dados completa e validada pelo PO.
- Kanban bem utilizado no GitHub Projects, facilitando a visibilidade do progresso.
- Dailies curtas e objetivas — nunca ultrapassaram 15 minutos.

### O que pode ser melhorado?
- As User Stories poderiam ter sido mais detalhadas antes do início das tasks de desenvolvimento.
- A integração entre front-end e back-end não foi iniciada nesta sprint — gera dependência para Sprint 2.
- Documentação de requisitos ficou para os últimos dias da sprint.

### Plano de Ação
- Asafe (PO) irá detalhar todas as US da Sprint 2 no primeiro dia do planejamento, com critérios de aceite completos.
- Gabriel e Otávio irão alinhar contrato de API no primeiro dia da Sprint 2 para viabilizar integração mais cedo.
- Juliete irá cobrar documentação parcial a cada Daily, evitando acúmulo no final."
echo "✅ [RETRO-01] criado."

echo ""
echo "✅ Sprint 1 completa! (9 issues)"
echo ""

# ============================================================
# SPRINT 2 — 09/03 a 23/03/2026
# ============================================================
echo "📌 Criando issues da Sprint 2..."

gh issue create --repo "$REPO" \
  --title "[SPRINT-02]: Planejamento e Review" \
  --label "Sprint" \
  --body "## Planejamento (Planning)

**Objetivo da Sprint:** Épico 01 (conclusão) + início do Épico 02. Implementar CRUD de exercícios, tela de histórico com dados reais, sistema de metas, e iniciar autenticação de usuário.

### Itens Priorizados:
- [x] [US-01.3]: Como personal trainer, quero editar e remover exercícios cadastrados
- [x] [US-01.4]: Como aluno, quero ver meu histórico de treinos com gráfico de progresso
- [x] [US-02.1]: Como usuário, quero me cadastrar e fazer login no aplicativo
- [x] [TASK]: Implementar CRUD de exercícios no back-end — Otávio
- [x] [TASK]: Implementar telas de CRUD no front-end integradas à API — Gabriel
- [x] [TASK]: Prototipar tela de autenticação e gráfico de progresso — Rafael
- [x] [TASK]: Revisar backlog e preparar User Stories do Épico 02 — Asafe
- [x] [TASK]: Atualizar documentação de requisitos e diário de bordo — Juliete

---

## Entrega (Review)
**O que foi desenvolvido?** CRUD de exercícios funcionando (front + back integrados), tela de histórico com gráfico de progresso, protótipo de autenticação, início da US-02.1 (cadastro de usuário).

**Link dos Slides:** [Slides Sprint 2 — a publicar]

**Métricas (Burndown):** 8 tasks planejadas — 8/8 concluídas. Integração front-back viabilizou entregas mais robustas nesta sprint."
echo "✅ [SPRINT-02] Planning & Review criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-02.01]: 10/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Review e Retro da Sprint 1. Hoje: Iniciar protótipo das telas de autenticação (Login, Cadastro de Usuário) e gráfico de progresso. Impedimento: Nenhum.
* **Gabriel:** Ontem: Review e Retro da Sprint 1. Hoje: Iniciar desenvolvimento das telas de CRUD de exercício consumindo a API do Otávio. Impedimento: Aguardando endpoint — alinhado com Otávio para entrega hoje.
* **Otávio:** Ontem: Review e Retro da Sprint 1. Hoje: Criar endpoints GET, POST, PUT, DELETE para Exercício. Impedimento: Nenhum.
* **Asafe:** Ontem: Review e Retro da Sprint 1. Hoje: Detalhar US-02.1 (autenticação) com critérios de aceite completos. Impedimento: Nenhum.
* **Juliete:** Ontem: Review e Retro da Sprint 1. Hoje: Atualizar Kanban para Sprint 2, mover tasks para To Do. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Gabriel e Otávio alinharam contrato de API de exercícios para início imediato.
- Asafe reforçou plano de ação da Retro: todas US detalhadas antes das tasks de dev."
echo "✅ [DAILY-02.01] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-02.02]: 12/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Tela de Login e Cadastro prototipadas. Hoje: Trabalhar no protótipo do gráfico de progresso (tela de histórico). Impedimento: Nenhum.
* **Gabriel:** Ontem: Tela de listagem de exercícios integrada com GET da API. Hoje: Implementar tela de criação de exercício (POST). Impedimento: Nenhum.
* **Otávio:** Ontem: Endpoints GET e POST de Exercício prontos. Hoje: Implementar PUT e DELETE de Exercício. Impedimento: Nenhum.
* **Asafe:** Ontem: US-02.1 detalhada. Hoje: Revisar com Juliete a documentação de requisitos da Sprint 2. Impedimento: Nenhum.
* **Juliete:** Ontem: Kanban atualizado. Hoje: Registrar progresso no diário de bordo e revisar documentação com Asafe. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Integração front-back fluindo bem desde o início da sprint — melhoria percebida em relação à Sprint 1."
echo "✅ [DAILY-02.02] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-02.03]: 14/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Protótipo de gráfico de progresso concluído. Hoje: Revisar fluxo completo de navegação do protótipo e ajustar micro-interações. Impedimento: Nenhum.
* **Gabriel:** Ontem: Tela de criação de exercício implementada. Hoje: Implementar telas de edição e exclusão (PUT/DELETE). Impedimento: Nenhum.
* **Otávio:** Ontem: CRUD completo de Exercício no back-end. Hoje: Iniciar endpoint de Histórico de Treinos (GET por usuário, com datas). Impedimento: Nenhum.
* **Asafe:** Ontem: Documentação revisada. Hoje: Validar com Rafael se o protótipo do gráfico está alinhado com US-01.4. Impedimento: Nenhum.
* **Juliete:** Ontem: Diário de bordo atualizado. Hoje: Verificar se tasks estão corretamente distribuídas no Kanban. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Asafe validou protótipo do gráfico com Rafael — aprovado com pequeno ajuste no eixo de datas.
- CRUD de Exercício concluído em front e back — tasks movidas para Done no Kanban."
echo "✅ [DAILY-02.03] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-02.04]: 16/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Micro-interações ajustadas. Hoje: Iniciar protótipo das telas do Épico 02 (Metas do Aluno). Impedimento: Nenhum.
* **Gabriel:** Ontem: Telas de edição e exclusão implementadas. Hoje: Iniciar tela de Histórico de Treinos consumindo endpoint do Otávio. Impedimento: Nenhum.
* **Otávio:** Ontem: Endpoint de Histórico de Treinos concluído. Hoje: Iniciar modelagem e endpoint para Metas (Épico 02). Impedimento: Nenhum.
* **Asafe:** Ontem: Protótipo de gráfico validado. Hoje: Priorizar itens do Épico 02 no backlog para o Planning da Sprint 3. Impedimento: Nenhum.
* **Juliete:** Ontem: Kanban verificado. Hoje: Atualizar Burndown com progresso da semana. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Sprint indo acima do esperado em ritmo — Asafe decidiu incluir início do Épico 02 ainda nesta sprint.
- Burndown mostra queima de pontos consistente."
echo "✅ [DAILY-02.04] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-02.05]: 18/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Protótipo de telas de Metas iniciado. Hoje: Finalizar protótipo das Metas e integrar ao fluxo geral do app. Impedimento: Nenhum.
* **Gabriel:** Ontem: Tela de Histórico integrada à API. Hoje: Adicionar gráfico de progresso à tela de Histórico (usando biblioteca de charts). Impedimento: Dúvida sobre qual biblioteca usar para gráficos.
* **Otávio:** Ontem: Modelagem de Metas feita. Hoje: Implementar endpoints de Metas (CRUD). Impedimento: Nenhum.
* **Asafe:** Ontem: Backlog do Épico 02 priorizado. Hoje: Definir critérios de aceite para US-02.2 (Metas do Aluno). Impedimento: Nenhum.
* **Juliete:** Ontem: Burndown atualizado. Hoje: Facilitar alinhamento sobre biblioteca de gráficos. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Decisão: Usar react-native-gifted-charts para gráficos de progresso (leve e compatível com Expo).
- Juliete registrou decisão no diário de bordo."
echo "✅ [DAILY-02.05] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-02.06]: 20/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Protótipo de Metas finalizado. Hoje: Revisar protótipo completo e preparar exportação para apresentação. Impedimento: Nenhum.
* **Gabriel:** Ontem: Gráfico de progresso integrado na tela de Histórico. Hoje: Iniciar tela de Metas (front-end), consumindo endpoints do Otávio. Impedimento: Nenhum.
* **Otávio:** Ontem: Endpoints de Metas concluídos (CRUD). Hoje: Revisar e testar endpoints, documentar retornos esperados. Impedimento: Nenhum.
* **Asafe:** Ontem: Critérios de aceite de US-02.2 definidos. Hoje: Validar tela de Histórico com gráfico — colher feedback do ponto de vista do PO. Impedimento: Nenhum.
* **Juliete:** Ontem: Decisão de biblioteca registrada. Hoje: Preparar pauta para Sprint Review. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Asafe validou tela de Histórico com gráfico — aprovada com sugestão de exibir % de meta atingida.
- Otávio irá adicionar campo de % de meta nos retornos da API."
echo "✅ [DAILY-02.06] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-02.07]: 22/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Protótipo exportado. Hoje: Último ajuste visual — garantir consistência entre dark e light mode. Impedimento: Nenhum.
* **Gabriel:** Ontem: Tela de Metas em desenvolvimento. Hoje: Finalizar tela de Metas e revisar código antes do Review. Impedimento: Nenhum.
* **Otávio:** Ontem: Campo % de meta adicionado à API. Hoje: Testar integração completa front-back em ambiente local. Impedimento: Nenhum.
* **Asafe:** Ontem: Feedback registrado. Hoje: Ensaiar apresentação do Sprint Review com equipe. Impedimento: Nenhum.
* **Juliete:** Ontem: Pauta preparada. Hoje: Facilitar Review e Retrospective amanhã. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Integração testada com sucesso — tela de Metas funcional, gráfico refletindo dados reais.
- Todas as tasks da Sprint 2 movidas para Done no Kanban."
echo "✅ [DAILY-02.07] criado."

gh issue create --repo "$REPO" \
  --title "[RETRO-02]: Sprint 02" \
  --label "Retrospective" \
  --body "### O que funcionou bem?
- Integração front-back foi iniciada no primeiro dia, conforme plano de ação da Retro anterior — grande melhoria.
- CRUD de exercícios entregue completo (front + back) dentro da sprint.
- Biblioteca de gráficos escolhida e integrada rapidamente após decisão coletiva.
- Ritmo alto permitiu iniciar o Épico 02 ainda nesta sprint.
- Comunicação entre Gabriel e Otávio foi excelente durante toda a sprint.

### O que pode ser melhorado?
- A tela de Metas não foi 100% finalizada até o Review — ficou como dívida técnica para a Sprint 3.
- Documentação de endpoints poderia ter sido feita em paralelo com o desenvolvimento, não só no final.
- Rafael estava trabalhando um pouco à frente da implementação — em alguns momentos o protótipo evoluía antes de a sprint anterior ser consolidada.

### Plano de Ação
- Gabriel irá priorizar finalização da tela de Metas como primeiro item da Sprint 3.
- Otávio documentará endpoints à medida que os implementa, não somente ao final.
- Juliete irá verificar alinhamento de protótipo vs. implementação nas dailies, para evitar descompasso entre design e dev."
echo "✅ [RETRO-02] criado."

echo ""
echo "✅ Sprint 2 completa! (9 issues)"
echo ""

# ============================================================
# SPRINT 3 — 23/03 a 06/04/2026
# ============================================================
echo "📌 Criando issues da Sprint 3..."

gh issue create --repo "$REPO" \
  --title "[SPRINT-03]: Planejamento e Review" \
  --label "Sprint" \
  --body "## Planejamento (Planning)

**Objetivo da Sprint:** Épico 02 (metade restante) — Finalizar sistema de Metas, implementar Timer de Treino, refinar MVP, consolidar documentação e preparar apresentação final.

### Itens Priorizados:
- [x] [US-02.2]: Como aluno, quero visualizar minhas metas e o progresso percentual atingido
- [x] [US-02.3]: Como aluno, quero usar um timer durante meu treino para controlar exercícios por tempo
- [x] [TASK]: Finalizar tela de Metas no front-end — Gabriel
- [x] [TASK]: Implementar timer funcional com controle de séries/descanso — Gabriel + Otávio
- [x] [TASK]: Prototipar tela do Timer e refinamento visual final — Rafael
- [x] [TASK]: Consolidar documentação final e slides de apresentação — Asafe + Juliete
- [x] [TASK]: Revisão geral do protótipo — alta fidelidade — Rafael

---

## Entrega (Review)
**O que foi desenvolvido?** Tela de Metas finalizada com % de progresso, Timer de Treino funcional (séries, descanso, tempo), protótipo em alta fidelidade completo, documentação final e slides prontos para apresentação.

**Link dos Slides:** [Slides Sprint 3 — a publicar]

**Métricas (Burndown):** 7 tasks planejadas — 7/7 concluídas. MVP completo entregue dentro do prazo final."
echo "✅ [SPRINT-03] Planning & Review criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-03.01]: 24/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Review e Retro da Sprint 2. Hoje: Iniciar protótipo da tela do Timer de Treino (exibição de séries, tempo e descanso). Impedimento: Nenhum.
* **Gabriel:** Ontem: Review e Retro da Sprint 2. Hoje: Finalizar tela de Metas (dívida técnica da Sprint 2). Impedimento: Nenhum.
* **Otávio:** Ontem: Review e Retro da Sprint 2. Hoje: Avaliar necessidade de endpoint para o Timer (lógica pode ser 100% client-side). Impedimento: Nenhum.
* **Asafe:** Ontem: Review e Retro da Sprint 2. Hoje: Iniciar estrutura da documentação final e dos slides de apresentação. Impedimento: Nenhum.
* **Juliete:** Ontem: Review e Retro da Sprint 2. Hoje: Atualizar Kanban para Sprint 3, facilitar alinhamento inicial. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Decisão: Timer será implementado como lógica client-side (sem necessidade de endpoint dedicado) — aprovado por Asafe.
- Gabriel prioriza finalização de Metas como primeiro item da sprint, conforme plano de ação da Retro."
echo "✅ [DAILY-03.01] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-03.02]: 26/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Wireframe do Timer iniciado. Hoje: Finalizar protótipo do Timer e integrar ao fluxo de Ficha de Treino. Impedimento: Nenhum.
* **Gabriel:** Ontem: Tela de Metas finalizada com % de progresso. Hoje: Iniciar implementação do componente de Timer. Impedimento: Nenhum.
* **Otávio:** Ontem: Confirmou que Timer é client-side. Hoje: Revisar documentação de todos os endpoints implementados e publicar no repo. Impedimento: Nenhum.
* **Asafe:** Ontem: Estrutura da documentação final iniciada. Hoje: Redigir seção de Visão do Produto e Requisitos na documentação final. Impedimento: Nenhum.
* **Juliete:** Ontem: Kanban atualizado. Hoje: Verificar alinhamento entre protótipo de Timer e o que Gabriel está implementando. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Tela de Metas finalizada — task movida para Done no Kanban.
- Juliete verificou alinhamento: protótipo de Rafael e componente de Gabriel estão em sincronia."
echo "✅ [DAILY-03.02] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-03.03]: 28/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Protótipo do Timer finalizado. Hoje: Iniciar refinamento visual final de todas as telas (alta fidelidade — cores, sombras, ícones finais). Impedimento: Nenhum.
* **Gabriel:** Ontem: Componente de Timer com contagem regressiva funcionando. Hoje: Adicionar lógica de troca automática entre séries e descanso. Impedimento: Nenhum.
* **Otávio:** Ontem: Documentação de endpoints publicada no repo. Hoje: Auxiliar Gabriel na integração do Timer com a estrutura de Ficha de Treino do back-end. Impedimento: Nenhum.
* **Asafe:** Ontem: Seção de Visão e Requisitos redigida. Hoje: Redigir seção de User Stories e Critérios de Aceite na documentação final. Impedimento: Nenhum.
* **Juliete:** Ontem: Alinhamento verificado. Hoje: Registrar decisões da sprint no diário de bordo. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Timer com contagem regressiva funcional — progresso acima do esperado.
- Otávio e Gabriel definiram como o Timer se integra com a ficha (exercício por tempo)."
echo "✅ [DAILY-03.03] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-03.04]: 30/03/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Refinamento visual em progresso (50% das telas revisadas). Hoje: Finalizar revisão de todas as telas no Figma — exportar assets finais. Impedimento: Nenhum.
* **Gabriel:** Ontem: Lógica de troca série/descanso implementada. Hoje: Testar o Timer com dados reais de exercícios por tempo. Impedimento: Nenhum.
* **Otávio:** Ontem: Integração Timer-Ficha concluída. Hoje: Realizar testes de ponta a ponta (front→back) nos fluxos principais do MVP. Impedimento: Nenhum.
* **Asafe:** Ontem: US e critérios de aceite redigidos. Hoje: Iniciar montagem dos slides de apresentação final. Impedimento: Nenhum.
* **Juliete:** Ontem: Diário de bordo atualizado. Hoje: Revisar se todas as User Stories têm critérios de aceite completos. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Testes de ponta a ponta iniciados — fluxo de cadastro de exercício e histórico funcionando.
- Asafe confirmou que todas as US do Épico 01 e 02 (metade) têm critérios de aceite completos."
echo "✅ [DAILY-03.04] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-03.05]: 01/04/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Assets finais exportados, protótipo em alta fidelidade concluído. Hoje: Revisar protótipo em conjunto com Gabriel para garantir que implementação reflete o design. Impedimento: Nenhum.
* **Gabriel:** Ontem: Timer testado com dados reais. Hoje: Ajustes de UX finos (animação de entrada das telas, feedback visual no Timer). Impedimento: Nenhum.
* **Otávio:** Ontem: Testes de ponta a ponta em progresso. Hoje: Finalizar testes e corrigir bugs encontrados. Impedimento: Bug menor no endpoint de histórico ao filtrar por data — estimativa de correção: hoje.
* **Asafe:** Ontem: Slides iniciados. Hoje: Avançar nos slides — seção de Backlog, Kanban e Burndown. Impedimento: Nenhum.
* **Juliete:** Ontem: US revisadas. Hoje: Revisar documentação final e garantir consistência entre todos os artefatos. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Bug registrado por Otávio no endpoint de Histórico (filtro por data) — sendo corrigido hoje.
- Rafael e Gabriel farão revisão conjunta do design vs. implementação."
echo "✅ [DAILY-03.05] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-03.06]: 03/04/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Revisão design vs. implementação concluída. Hoje: Ajuste final — ícones da barra de navegação. Impedimento: Nenhum.
* **Gabriel:** Ontem: Animações e feedbacks visuais implementados. Hoje: Revisão final do código front-end, garantindo organização para apresentação. Impedimento: Nenhum.
* **Otávio:** Ontem: Bug do histórico corrigido. Hoje: Revisão final do back-end e banco de dados, garantindo integridade dos dados. Impedimento: Nenhum.
* **Asafe:** Ontem: Slides com Backlog e Kanban concluídos. Hoje: Finalizar slides — seção de MVP, protótipo e BD. Impedimento: Nenhum.
* **Juliete:** Ontem: Documentação revisada. Hoje: Última checagem geral dos artefatos — garantir que tudo está no repo. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Bug corrigido e validado — endpoint de Histórico funcionando corretamente.
- MVP considerado pronto pela equipe. Foco final em apresentação e documentação."
echo "✅ [DAILY-03.06] criado."

gh issue create --repo "$REPO" \
  --title "[DAILY-03.07]: 05/04/2026" \
  --label "Daily" \
  --body "### Participantes
- [x] Rafael | [x] Gabriel | [x] Asafe | [x] Otávio | [x] Juliete

---

### Relatos Individuais
*O que eu fiz ontem? | O que farei hoje? | Algum impedimento?*

* **Rafael:** Ontem: Ícones ajustados. Hoje: Ensaiar apresentação da parte de design e protótipo. Impedimento: Nenhum.
* **Gabriel:** Ontem: Código revisado. Hoje: Ensaiar demonstração do MVP funcionando. Impedimento: Nenhum.
* **Otávio:** Ontem: Back-end e BD revisados. Hoje: Ensaiar apresentação da modelagem e dos endpoints. Impedimento: Nenhum.
* **Asafe:** Ontem: Slides finalizados. Hoje: Ensaio geral da apresentação com toda a equipe. Impedimento: Nenhum.
* **Juliete:** Ontem: Artefatos verificados. Hoje: Facilitar ensaio, garantir que apresentação cobre todos os critérios de avaliação. Impedimento: Nenhum.

---

### Impedimentos e Decisões
- Sprint 3 concluída. Todos os critérios de aceite validados.
- MVP completo: protótipo navegável + modelagem de BD + front-end funcional integrado ao back-end.
- Kanban: 100% das tasks em Done."
echo "✅ [DAILY-03.07] criado."

gh issue create --repo "$REPO" \
  --title "[RETRO-03]: Sprint 03" \
  --label "Retrospective" \
  --body "### O que funcionou bem?
- MVP entregue completo dentro do prazo final — grande conquista da equipe.
- Timer implementado rapidamente graças à decisão ágil de torná-lo client-side.
- Documentação final e slides entregues com antecedência.
- Revisão conjunta de design vs. implementação (Rafael + Gabriel) garantiu fidelidade visual.
- Otávio corrigiu bug crítico em 24h sem impactar o cronograma.
- Juliete manteve a equipe alinhada e os artefatos organizados em todas as sprints.

### O que pode ser melhorado?
- Dívidas técnicas entre sprints (tela de Metas veio da Sprint 2) deveriam ser evitadas com melhor estimativa de tasks.
- Testes automatizados não foram implementados — dependência de testes manuais.
- Slides poderiam ter sido iniciados mais cedo (Sprint 2) para não sobrecarregar a Sprint 3.

### Plano de Ação
- Para próximos projetos: incluir buffer de 10% nas estimativas de tasks para absorver dívidas técnicas.
- Estudar e adotar testes automatizados (ex: Jest + Testing Library) em versões futuras do produto.
- Iniciar preparação de slides e documentação final a partir da Sprint 2 nos próximos ciclos."
echo "✅ [RETRO-03] criado."

echo ""
echo "✅ Sprint 3 completa! (9 issues)"
echo ""
echo "=============================================="
echo "🎉 CONCLUÍDO! 30 issues criados com sucesso!"
echo "   Sprint 1: 9 issues"
echo "   Sprint 2: 9 issues"
echo "   Sprint 3: 9 issues"
echo "   Acesse: https://github.com/$REPO/issues"
echo "=============================================="