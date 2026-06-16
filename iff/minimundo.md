# Minimundo – TT IFF (Training Timer IFF)

## Visão Geral do Sistema

O **TT IFF** é um sistema web de gestão de fichas de treino desenvolvido para a academia do Instituto Federal Fluminense (IFF). Seu objetivo é substituir as fichas físicas de papel por uma plataforma digital que conecta professores de educação física a seus alunos, centralizando a criação, distribuição e acompanhamento dos treinos.

O sistema é composto por um **Portal Web** utilizado pelo professor e um **App Mobile** utilizado pelo aluno, ambos integrados a um backend central via API REST autenticada.

---

## Usuários

O sistema possui dois perfis de usuário: **Professor** e **Aluno**. Todo usuário possui nome completo, e-mail único, senha e um indicador de situação (ativo ou inativo). O perfil é definido no momento do cadastro e não pode ser alterado posteriormente — um usuário não pode exercer os dois papéis simultaneamente.

Quando um aluno é desativado (exclusão lógica), seus dados e histórico são preservados no banco de dados, mas o acesso ao sistema é bloqueado imediatamente. Não há exclusão física de registros de usuários.

---

## Professor

O Professor acessa o sistema exclusivamente pelo Portal Web. Suas responsabilidades são:

- Cadastrar, visualizar, editar e desativar alunos;
- Criar, editar, duplicar e excluir fichas de treino;
- Atribuir fichas a alunos com controle de vigência;
- Definir metas individuais para cada aluno;
- Consultar o histórico de sessões de seus alunos.

O Professor não executa treinos e não possui acesso ao fluxo de execução do App Mobile.

---

## Aluno

O Aluno acessa o sistema exclusivamente pelo App Mobile. Suas responsabilidades são:

- Visualizar as fichas de treino vigentes atribuídas a ele pelo professor;
- Executar os treinos com auxílio do timer e dos controles do app;
- Acompanhar seu próprio histórico de sessões.

O Aluno não pode criar, editar, duplicar nem excluir fichas de treino. As alterações feitas pelo Professor em uma ficha atribuída refletem para o Aluno na próxima sincronização do app.

---

## Ficha de Treino

A **Ficha de Treino** é o documento digital que substitui a ficha física da academia. Ela é criada pelo Professor e pertence a exatamente um professor. Cada ficha possui um nome e uma data de criação.

Uma ficha é composta por um ou mais **Blocos**, que representam seções lógicas do treino (por exemplo: Aquecimento, Principal, Aeróbico). Cada bloco possui um nome e uma ordem de exibição dentro da ficha.

Cada bloco contém uma ou mais **Séries**, que são as unidades atômicas de execução. Cada série possui:

- **Nome do exercício** (ex.: Supino Reto, Burpees);
- **Tipo de execução**: TEMPO (medido em segundos) ou REPETIÇÕES (medido em quantidade);
- **Valor**: a duração em segundos ou a quantidade de repetições, de acordo com o tipo;
- **Tempo de descanso** em segundos, exibido ao aluno entre as séries;
- **Ordem** de exibição dentro do bloco.

Fichas de treino não são removidas fisicamente do sistema. Quando uma ficha deixa de ser utilizada, ela é desativada. Dessa forma, o histórico de atribuições e sessões permanece íntegro e acessível.

---

## Atribuição de Ficha

A **Atribuição** é o vínculo entre uma Ficha de Treino e um Aluno. O Professor é responsável por criar atribuições, definindo a data de início da vigência e, opcionalmente, uma data de fim.

- Fichas atribuídas sem data de fim permanecem vigentes indefinidamente.
- Um aluno pode ter múltiplas fichas atribuídas simultaneamente.
- Uma mesma ficha pode ser atribuída a diferentes alunos.
- O Aluno visualiza no app apenas as fichas dentro do período de vigência ativo.

---

## Sessão de Treino

A **Sessão** é o registro automático gerado cada vez que um Aluno executa uma ficha no App Mobile. Uma sessão contém:

- Referência ao Aluno que executou;
- Referência à Ficha executada;
- **Snapshot do nome da ficha** — preserva o nome mesmo que a ficha seja excluída futuramente;
- Data e hora de início;
- Duração total em segundos;
- Status: **COMPLETA** (o aluno finalizou o treino) ou **INTERROMPIDA** (o treino foi encerrado antes do fim).

O Professor pode consultar o histórico de sessões de seus alunos, com filtro por período e por ficha. O Aluno visualiza apenas o próprio histórico.

---

## Metas

O Professor pode definir **Metas** individuais para cada aluno. Uma meta é sempre vinculada a um aluno e ao professor que a criou. Opcionalmente, pode referenciar uma Ficha de Treino específica ou o nome de um exercício específico.

Cada meta possui uma descrição textual e um status: **EM_PROGRESSO** ou **ATINGIDA**.

As metas são individuais — não existe meta global aplicada a todos os alunos de uma só vez. Quando o Aluno conclui uma sessão que representa o atingimento de uma meta, ele é notificado dentro do próprio app (notificação *in-app*). O sistema não utiliza notificações push externas.

---

## Regras de Negócio Relevantes

| # | Regra |
|---|-------|
| RB01 | Somente o Professor pode criar, editar, duplicar ou excluir fichas de treino. |
| RB02 | O Aluno visualiza apenas fichas vigentes atribuídas a ele. |
| RB03 | O Aluno não pode editar fichas atribuídas. Alterações do Professor refletem na próxima sincronização. |
| RB04 | O Aluno visualiza apenas o próprio histórico. O Professor visualiza o histórico de seus alunos. |
| RB05 | Metas são definidas individualmente por aluno. Não há metas globais. |
| RB06 | Notificações de meta atingida são exclusivamente in-app. |
| RB07 | A desativação de um aluno preserva histórico e dados, mas bloqueia o acesso ao sistema. |
| RB08 | A exclusão de uma ficha não apaga sessões registradas. O nome é preservado via snapshot. |
