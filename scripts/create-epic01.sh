#!/bin/bash
set -euo pipefail

REPO="Tart-development/training-timer-documentation"

echo "🚀 Criando EPIC-01 + US + Tasks da Sprint 1..."
echo ""

# ============================================================
# EPIC-01
# ============================================================
gh issue create --repo "$REPO" \
  --title "[EPIC-01]: Fundação do Produto — Configuração, Prototipação e Modelagem" \
  --label "Epic" \
  --body "| Atributo | Valor |
| :--- | :--- |
| **ID do Épico** | \`01\` |
| **Persona Principal** | \`Personal Trainer / Aluno\` |
| **Versão do Projeto** | \`0.1.0\` |

---

## Descrição

Este épico representa a fundação do produto Training Timer. Seu objetivo é estabelecer as bases técnicas e de design do MVP: configurar os ambientes de desenvolvimento (front-end e back-end), criar o protótipo navegável das telas principais no Figma, definir a modelagem inicial do banco de dados e estruturar o processo de gestão ágil via GitHub Projects. Sem este épico, nenhuma funcionalidade pode ser desenvolvida com consistência.

---

## Escopo e Funcionalidades

| Nome | Descrição | Prioridade |
| :--- | :--- | :--- |
| **Configuração do Ambiente Front-End** | \`Inicializar projeto React Native/Expo com estrutura de pastas, dependências e navegação base.\` | *Must* |
| **Prototipação das Telas Principais** | \`Criar protótipo navegável no Figma (Login, Dashboard, Ficha de Treino, Histórico).\` | *Must* |
| **Modelagem Inicial do BD** | \`Definir entidades principais: User, Treino, Exercício — com diagrama ER e dicionário de dados.\` | *Must* |
| **Configuração do Kanban** | \`Configurar GitHub Projects com colunas: Backlog, To Do, In Progress, Testing, Done.\` | *Must* |
| **Documentação de Visão e Requisitos** | \`Redigir visão do sistema, requisitos funcionais e não funcionais do MVP.\` | *Must* |

---

## Requisitos Não-Funcionais

| Nome | Descrição |
| :--- | :--- |
| **Usabilidade** | \`O protótipo deve ser navegável e representar fielmente o fluxo do usuário final.\` |
| **Rastreabilidade** | \`Todos os requisitos devem estar documentados e rastreáveis às User Stories.\` |
| **Organização** | \`O Kanban deve refletir o estado real das tasks em tempo real durante a sprint.\` |

---

## Critérios de Aceite do Épico

Para que este épico seja considerado **concluído**, o fluxo de usuário deve estar funcional e atender aos seguintes critérios:

* [ ] Projeto front-end inicializado, rodando localmente sem erros (\`expo start\`)
* [ ] Protótipo navegável no Figma com telas de Login, Dashboard, Ficha de Treino e Histórico
* [ ] Diagrama ER com entidades User, Treino e Exercício documentado no repositório
* [ ] Kanban configurado no GitHub Projects com todas as colunas e backlog inicial populado
* [ ] Documento de visão, requisitos funcionais e não funcionais publicado no repositório"

echo "✅ [EPIC-01] criado."
echo ""

# ============================================================
# USER STORIES — EPIC-01
# ============================================================
echo "📋 Criando User Stories do EPIC-01..."

gh issue create --repo "$REPO" \
  --title "[UH-01.1]: Cadastrar exercícios para alunos" \
  --label "User Story" \
  --body "* ### **WHO? (Quem?)**
   **Personal Trainer**
   *Profissional responsável por montar e gerenciar os treinos dos seus alunos.*

* ### **WHAT? (O Quê?)**
   **Cadastrar exercícios personalizados (por tempo, peso ou distância) para os meus alunos**
   *A funcionalidade de criação de exercícios com tipos distintos de medição.*

* ### **WHY? (Por quê?)**
   **Para que eu possa substituir as fichas de papel por uma plataforma digital organizada**
   *Eliminar retrabalho manual e centralizar as informações de treino em um único lugar.*

---

## História de Usuário

> Como um **Personal Trainer**, eu quero **cadastrar exercícios personalizados (por tempo, peso ou distância)**, para que eu possa **substituir as fichas de papel e gerenciar os treinos dos meus alunos digitalmente**.

### Descrição

O personal trainer acessa a tela de criação de exercício, preenche nome, tipo (tempo/peso/distância), valor e descrição opcional, e salva. O exercício fica disponível para ser associado a uma ficha de treino.

---

### Critérios de Aceite

Estes são os testes a serem aprovados para que a história seja considerada CONCLUÍDA.

- [ ] **[Cenário 1 - Sucesso]:** Personal cria um exercício com tipo 'peso', nome e valor — exercício aparece na listagem.
- [ ] **[Cenário 2 - Validação]:** Campos obrigatórios (nome e tipo) não podem estar vazios — sistema exibe mensagem de erro.
- [ ] **[Cenário 3 - Tipo Tempo]:** Personal cria exercício por tempo — campo de valor aceita formato em segundos/minutos."

echo "✅ [UH-01.1] criada."

gh issue create --repo "$REPO" \
  --title "[UH-01.2]: Visualizar ficha de treino digital" \
  --label "User Story" \
  --body "* ### **WHO? (Quem?)**
   **Aluno**
   *Usuário que realiza os treinos prescritos pelo personal trainer.*

* ### **WHAT? (O Quê?)**
   **Visualizar minha ficha de treino digital no aplicativo**
   *Tela que exibe os exercícios do treino atual com nome, tipo e carga.*

* ### **WHY? (Por quê?)**
   **Para que eu possa acompanhar meu treino sem depender de fichas de papel**
   *Ter acesso rápido e organizado às informações do treino durante a execução.*

---

## História de Usuário

> Como um **Aluno**, eu quero **visualizar minha ficha de treino digital**, para que eu possa **acompanhar os exercícios sem depender de fichas de papel**.

### Descrição

O aluno acessa o aplicativo, navega até a tela de ficha de treino e visualiza a lista de exercícios do seu treino atual com nome, tipo (tempo/peso/distância) e carga definida pelo personal.

---

### Critérios de Aceite

Estes são os testes a serem aprovados para que a história seja considerada CONCLUÍDA.

- [ ] **[Cenário 1 - Sucesso]:** Aluno acessa a tela de ficha e visualiza todos os exercícios do treino com nome e carga.
- [ ] **[Cenário 2 - Validação]:** Se não houver treino cadastrado, sistema exibe mensagem informativa.
- [ ] **[Cenário 3 - Tipos distintos]:** Exercícios por tempo, peso e distância são exibidos com unidade correta."

echo "✅ [UH-01.2] criada."
echo ""

# ============================================================
# TASKS — EPIC-01 / SPRINT 1
# ============================================================
echo "🔧 Criando Tasks do EPIC-01 (Sprint 1)..."

gh issue create --repo "$REPO" \
  --title "[TASK-01.1.1]: Configuração do ambiente front-end" \
  --label "Task" \
  --body "## Checklist Técnico:

- [ ] Inicializar projeto com Expo (\`npx create-expo-app\`)
- [ ] Configurar React Navigation (Stack + Tab)
- [ ] Definir estrutura de pastas: \`src/screens\`, \`src/components\`, \`src/services\`, \`src/navigation\`
- [ ] Instalar dependências base: \`@expo/vector-icons\`, \`axios\`, \`react-native-async-storage\`
- [ ] Garantir que \`expo start\` roda sem erros no ambiente local
- [ ] Versionar no GitHub com commit inicial

### Critérios de Aceite

- Projeto rodando localmente via \`expo start\` sem erros
- Estrutura de pastas definida e commitada
- README com instruções de setup atualizado

**Responsável:** Gabriel"

echo "✅ [TASK-01.1.1] criada."

gh issue create --repo "$REPO" \
  --title "[TASK-01.1.2]: Prototipação das telas principais no Figma" \
  --label "Task" \
  --body "## Checklist Técnico:

- [ ] Criar arquivo no Figma para o projeto Training Timer
- [ ] Prototipar tela de Login / Cadastro
- [ ] Prototipar tela de Dashboard (visão geral do aluno)
- [ ] Prototipar tela de Ficha de Treino (listagem de exercícios)
- [ ] Prototipar tela de Histórico de Treinos
- [ ] Definir paleta de cores, tipografia e componentes base (Design System mínimo)
- [ ] Configurar fluxo de navegação entre as telas no Figma (protótipo navegável)
- [ ] Compartilhar link do Figma no repositório de documentação

### Critérios de Aceite

- Protótipo navegável com fluxo Login → Dashboard → Ficha → Histórico
- Componentes visuais consistentes (cores e tipografia)
- Link do Figma disponibilizado na documentação

**Responsável:** Rafael"

echo "✅ [TASK-01.1.2] criada."

gh issue create --repo "$REPO" \
  --title "[TASK-01.1.3]: Modelagem inicial do BD (User, Treino, Exercício)" \
  --label "Task" \
  --body "## Checklist Técnico:

- [ ] Definir entidade \`User\` (id, nome, email, tipo: aluno/personal, criado_em)
- [ ] Definir entidade \`Treino\` (id, nome, descricao, user_id, criado_em)
- [ ] Definir entidade \`Exercicio\` (id, nome, tipo: tempo/peso/distancia, valor, unidade, treino_id)
- [ ] Criar diagrama ER (ferramenta: dbdiagram.io ou draw.io)
- [ ] Redigir dicionário de dados (campos, tipos, restrições)
- [ ] Validar modelagem com PO (Asafe)
- [ ] Publicar diagrama e dicionário no repositório de documentação

### Critérios de Aceite

- Diagrama ER publicado no repositório
- Dicionário de dados completo (campos + tipos + restrições)
- Modelagem cobre exercícios por tempo, peso e distância
- Aprovada pelo PO

**Responsável:** Otávio"

echo "✅ [TASK-01.1.3] criada."

gh issue create --repo "$REPO" \
  --title "[TASK-01.1.4]: Configuração do Kanban + backlog no GitHub Projects" \
  --label "Task" \
  --body "## Checklist Técnico:

- [ ] Criar projeto no GitHub Projects (tipo: Board)
- [ ] Configurar colunas: Backlog, To Do (Sprint), In Progress, Testing, Done
- [ ] Popular backlog com épicos, user stories e tasks do MVP
- [ ] Definir e documentar critério de movimentação entre colunas
- [ ] Adicionar campos customizados: Sprint, Prioridade, Tipo (Epic/US/Task)
- [ ] Convidar todos os membros da equipe ao projeto
- [ ] Comunicar processo de uso ao time na daily

### Critérios de Aceite

- GitHub Project criado e acessível a todos os membros
- Colunas configuradas conforme definição
- Backlog inicial populado com os itens da Sprint 1
- Link do projeto disponibilizado no README da documentação

**Responsável:** Asafe"

echo "✅ [TASK-01.1.4] criada."

gh issue create --repo "$REPO" \
  --title "[TASK-01.1.5]: Documentação de visão + requisitos funcionais/não-funcionais" \
  --label "Task" \
  --body "## Checklist Técnico:

- [ ] Redigir seção de Visão do Sistema (problema, público-alvo, proposta de valor)
- [ ] Listar Requisitos Funcionais (RF) rastreáveis às User Stories
- [ ] Listar Requisitos Não-Funcionais (RNF): usabilidade, desempenho, segurança, acessibilidade
- [ ] Revisar documento com toda a equipe
- [ ] Versionar documento no repositório de documentação (\`docs/requisitos.md\` ou similar)
- [ ] Garantir que todos os RFs estão cobertos por pelo menos uma User Story

### Critérios de Aceite

- Documento publicado no repositório de documentação
- Visão do sistema clara e aprovada pelo PO
- RFs e RNFs listados e rastreáveis
- Revisado por pelo menos 2 membros da equipe

**Responsáveis:** Juliete + Asafe"

echo "✅ [TASK-01.1.5] criada."

echo ""
echo "=============================================="
echo "🎉 CONCLUÍDO!"
echo "   1 Épico (EPIC-01)"
echo "   2 User Stories (UH-01.1, UH-01.2)"
echo "   5 Tasks (TASK-01.1.1 a TASK-01.1.5)"
echo "   Total: 8 issues criados"
echo "   Acesse: https://github.com/$REPO/issues"
echo "=============================================="