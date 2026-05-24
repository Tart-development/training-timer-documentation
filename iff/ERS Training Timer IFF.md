**Documento de Especificação de**

**Requisitos de Software (ERS / SRS)**

**Training Timer – TT IFF (Sistema de Gestão de Fichas de Treino)**

*Conforme IEEE 830*

| Sistema | TT IFF – Sistema de Gestão de Fichas de Treino |
| :---- | :---- |
| **Produto** | Training Timer – Produto 2 |
| **Versão** | 1.0 |
| **Data** | Novembro de 2025 |
| **Status** | Em planejamento |

# **1. Introdução**

## **1.1 Propósito**

Este documento descreve os requisitos do TT IFF, Produto 2 do ecossistema Training Timer. O sistema é uma plataforma digital desenvolvida para substituir as fichas de treino físicas da academia do IFF, centralizar a gestão de treinos e conectar professores a alunos por meio de um portal web e um aplicativo mobile integrados. O documento servirá como referência para desenvolvedores, testadores e demais envolvidos, garantindo clareza quanto às funcionalidades esperadas, limitações e regras de negócio.

## **1.2 Escopo**

O TT IFF terá como objetivo:

* Permitir ao professor criar e atribuir fichas de treino personalizadas a alunos via Portal Web

* Permitir ao aluno visualizar e executar a ficha atribuída via App Mobile

* Registrar o histórico de sessões executadas e disponibilizá-lo para professor e aluno

* Controlar o acesso por perfil (Professor / Aluno) com autenticação JWT

* Eliminar o uso de fichas físicas de papel na academia do IFF

## **1.3 Definições, Acrônimos e Abreviações**

Para o mapeamento completo entre termos do documento e termos do código, consulte a seção 1.6 – Glossário de Nomenclatura.

* **TT –** Training Timer — nome do ecossistema digital

* **TT IFF –** Produto 2: sistema integrado Mobile + Web para uso institucional no IFF

* **RF –** Requisito Funcional

* **RNF –** Requisito Não Funcional

* **RB –** Regra de Negócio

* **MVP –** Produto Mínimo Viável

* **JWT –** JSON Web Token (token de autenticação stateless)

* **API REST –** Interface de comunicação entre os frontends (web/mobile) e o backend

## **1.4 Referências**

* IEEE Std 830-1998: Recommended Practice for Software Requirements Specifications

* SRS Unificado do Ecossistema Training Timer — Versão Original (Nov/2025)

* Aplicativos analisados como referência de mercado:
  * Fitify: https://play.google.com/store/apps/details?id=com.fitifyworkouts.bodyweight.workoutapp
  * Pacto: https://play.google.com/store/apps/details?id=com.pacto

## **1.5 Visão Geral do Documento**

Organizado em: introdução e glossário de nomenclatura, descrição geral, requisitos funcionais e não funcionais, regras de negócio, modelos de apoio e considerações finais com priorização MoSCoW.

## **1.6 Glossário de Nomenclatura**

| Termo no Documento | Termo no Código | Descrição |
| :---- | :---- | :---- |
| Professor | User (role: PROFESSOR) | Usuário com permissão para criar fichas, gerenciar alunos e acompanhar histórico via Portal Web. |
| Aluno | User (role: ALUNO) | Usuário que visualiza e executa os treinos atribuídos pelo professor via App Mobile. |
| Ficha de Treino | WorkoutSheet | Conjunto de blocos e séries criado pelo professor e atribuído a um aluno. Substitui a ficha física. |
| Bloco | WorkoutBlock | Seção lógica de uma ficha (ex.: Aquecimento, Principal, Aeróbico). |
| Série | ExerciseSet | Unidade de execução de um exercício dentro de um bloco, com tipo, valor e descanso configurados. |
| Atribuição | SheetAssignment | Vínculo entre uma WorkoutSheet e um aluno, com data de início de vigência. |
| Sessão | WorkoutSession | Registro de uma execução de ficha pelo aluno, com data, duração e status. |
| Tipo de exercício | ExerciseType | Enum: TEMPO (segundos) ou REPETICOES (quantidade). |

# **2. Descrição Geral**

## **2.1 Perspectiva do Produto**

O TT IFF é um sistema cliente-servidor composto por três componentes integrados. Os dois frontends (Portal Web e App Mobile) comunicam-se exclusivamente com o Backend Central via API REST autenticada com JWT. Toda a lógica de negócio reside no backend.

| Componente | Tecnologia | Ator | Restrição |
| :---- | :---- | :---- | :---- |
| Portal Web | Next.js + TypeScript | Professor | Requer internet e login |
| App Mobile | React Native + TypeScript | Aluno | Requer login; dados via API |
| Backend | Spring (Java) + Spring Security | — | API REST via HTTPS, JWT |
| Banco de Dados | MySQL | — | Hospedado no servidor do IFF |

## **2.2 Funções do Produto**

* **Gestão de alunos:** O professor cadastra, edita e desativa alunos no Portal Web

* **Gestão de fichas:** O professor cria, edita, duplica e exclui fichas de treino estruturadas em blocos e séries

* **Atribuição de fichas:** O professor atribui fichas a alunos com data de vigência

* **Execução guiada:** O aluno executa a ficha atribuída no App Mobile com timer, sons e controles de sessão

* **Histórico de sessões:** Sessões são registradas automaticamente e visíveis para professor e aluno

* **Gestão de metas:** O professor define metas por aluno; o aluno é notificado in-app ao atingi-las

## **2.3 Características dos Usuários**

* **Professor (ROLE\_PROFESSOR):** Acessa o Portal Web para gerenciar alunos, criar fichas e acompanhar evolução. Familiaridade básica com sistemas web. Não executa treinos — apenas gerencia.

* **Aluno (ROLE\_ALUNO):** Acessa o App Mobile para visualizar a ficha do dia e executar o treino. Pode ser iniciante em tecnologia. Não cria nem edita fichas — apenas executa.

Um usuário não pode exercer os dois perfis simultaneamente. O perfil é definido no cadastro e controlado pelo backend.

## **2.4 Restrições**

* Autenticação obrigatória para ambos os perfis — sem acesso anônimo

* O Aluno não pode criar, editar ou excluir fichas de treino

* O Professor não executa treinos — não possui acesso ao fluxo de execução

* O App Mobile depende de conexão para buscar fichas atualizadas e registrar sessões

* Toda comunicação deve ocorrer via HTTPS com tokens JWT de expiração configurada

* O app não deve exibir anúncios que interrompam ou prejudiquem a execução do treino

## **2.5 Suposições e Dependências**

* O IFF disponibiliza infraestrutura de servidor para hospedar o backend e o banco MySQL

* Os alunos possuem dispositivos Android com acesso à internet durante o uso do app

* O cadastro inicial de alunos e professores é realizado pelo próprio professor

* Não há integração com sistemas de SSO ou autenticação institucional do IFF nesta versão

# **3. Requisitos Específicos**

## **3.1 Requisitos Funcionais**

### Professor – Portal Web

| ID | Descrição | Prioridade (MoSCoW) |
| :---- | :---- | :---- |
| **RF01** | O sistema deve permitir que o professor realize login e logout no Portal Web com e-mail e senha. | **Must Have** |
| **RF02** | O sistema deve permitir ao professor realizar CRUD completo de alunos (cadastrar, visualizar, editar e desativar). | **Must Have** |
| **RF03** | O sistema deve permitir ao professor realizar CRUD de fichas de treino (criar, visualizar, editar, duplicar e excluir). | **Must Have** |
| **RF04** | O sistema deve permitir que fichas sejam estruturadas em blocos e séries, com tipo de execução (tempo ou repetições), valor e descanso configuráveis por série. | **Must Have** |
| **RF05** | O sistema deve permitir ao professor atribuir uma ou mais fichas a um aluno com data de início de vigência. | **Must Have** |
| **RF06** | O sistema deve permitir ao professor consultar o histórico de sessões executadas por cada aluno, com filtro por período e por ficha. | **Should Have** |
| **RF07** | O sistema deve permitir ao professor definir metas de progresso vinculadas a um aluno, a uma ficha ou a um exercício específico. | **Should Have** |

### Aluno – App Mobile

| ID | Descrição | Prioridade (MoSCoW) |
| :---- | :---- | :---- |
| **RF08** | O sistema deve permitir que o aluno realize login e logout no App Mobile com e-mail e senha. | **Must Have** |
| **RF09** | O sistema deve exibir ao aluno somente as fichas vigentes atribuídas a ele pelo professor. | **Must Have** |
| **RF10** | O sistema deve conduzir o aluno pela execução da ficha com timer, transições automáticas e exibição de nome do exercício, série, tipo e valor. | **Must Have** |
| **RF11** | O sistema deve oferecer controles de execução: pausar/retomar, pular para o próximo exercício e retroceder ao anterior. | **Must Have** |
| **RF12** | O sistema deve exibir o próximo exercício durante o período de descanso entre séries. | **Must Have** |
| **RF13** | O sistema deve emitir sons distintos ao iniciar um exercício, ao sinalizar término próximo e ao iniciar o período de descanso. | **Must Have** |
| **RF14** | O sistema deve registrar automaticamente cada sessão com nome da ficha, data/hora de início, duração total e status (completa ou interrompida). | **Must Have** |
| **RF15** | O sistema deve notificar o aluno dentro do app ao concluir uma sessão que representa o atingimento de uma meta. | **Should Have** |

## **3.2 Requisitos Não Funcionais**

| ID | Descrição | Prioridade (MoSCoW) |
| :---- | :---- | :---- |
| **RNF01** | O sistema deve autenticar usuários via JWT com rotas protegidas por perfil (ROLE\_PROFESSOR / ROLE\_ALUNO). Requisições sem token válido retornam HTTP 401; acesso a rotas de outro perfil retorna HTTP 403. | **Must Have** |
| **RNF02** | A interface do app deve ser intuitiva para o aluno executar o treino sem treinamento prévio. | **Must Have** |
| **RNF03** | O portal web deve ser objetivo para o professor criar e atribuir fichas sem passos desnecessários. | **Must Have** |
| **RNF04** | O app deve ser responsivo em dispositivos Android de entrada (low-end). | **Must Have** |
| **RNF05** | O backend deve ser organizado em arquitetura de camadas com separação clara entre Controller, Service e Repository. | **Must Have** |
| **RNF06** | A API deve ter disponibilidade adequada ao uso acadêmico (horário comercial e noturno em dias letivos). | **Should Have** |
| **RNF07** | A UI do app deve ser limpa e sem anúncios, com fonte mínima de 16sp nas telas de execução. | **Must Have** |

## **3.3 Regras de Negócio**

| ID | Descrição | Prioridade (MoSCoW) |
| :---- | :---- | :---- |
| **RB01** | Somente o Professor pode criar, editar, duplicar ou excluir fichas de treino. O perfil Aluno não tem acesso a nenhuma dessas operações. | **Must Have** |
| **RB02** | O Aluno visualiza exclusivamente as fichas que lhe foram atribuídas pelo Professor e que estão dentro do período de vigência. | **Must Have** |
| **RB03** | Uma ficha atribuída ao Aluno não pode ser alterada por ele. Edições feitas pelo Professor refletem para o Aluno na próxima sincronização. | **Must Have** |
| **RB04** | O histórico de sessões é vinculado ao Aluno que executou. O Professor visualiza o histórico de seus alunos; o Aluno visualiza apenas o próprio. | **Must Have** |
| **RB05** | Metas são definidas individualmente pelo Professor por aluno. Não existe meta global aplicada a todos os alunos de uma vez. | **Should Have** |
| **RB06** | As notificações de meta atingida ocorrem exclusivamente dentro do app (in-app). O sistema não utiliza push notifications externas nesta versão. | **Should Have** |
| **RB07** | Ao desativar um aluno (soft delete), seus dados e histórico são preservados. O aluno desativado não consegue autenticar-se no app. | **Must Have** |
| **RB08** | A exclusão de uma ficha não apaga o histórico de sessões dos alunos que a executaram. O nome da ficha é preservado como snapshot na sessão. | **Must Have** |
| **RB09** | Ajuste de carga unificado: ao aplicar ajuste geral em uma ficha, o sistema propaga para todos os exercícios: ±1 repetição (séries por repetição) ou ±60 segundos (séries por tempo). | **Could Have** |

# **4. Modelos e Diagramas de Apoio**

## **4.1 Diagrama de Casos de Uso**

A ser elaborado. Os atores principais são: Professor e Aluno. Os casos de uso prioritários são: Criar Ficha, Atribuir Ficha, Gerenciar Alunos (Professor) · Executar Treino, Visualizar Ficha, Consultar Histórico (Aluno).

## **4.2 Estrutura de Dados – Modelo Conceitual**

```
User
├── id
├── name
├── email
├── passwordHash
├── role: PROFESSOR | ALUNO
└── active: boolean

WorkoutSheet
├── id
├── name
├── professorId        (FK → User)
├── createdAt
└── blocks: WorkoutBlock[]
    ├── id
    ├── name
    ├── order
    └── sets: ExerciseSet[]
        ├── id
        ├── order
        ├── exerciseName
        ├── type: TEMPO | REPETICOES
        ├── value          // segundos ou quantidade
        └── restSeconds

SheetAssignment
├── id
├── sheetId            (FK → WorkoutSheet)
├── studentId          (FK → User)
├── startDate
└── endDate            // nullable — sem data fim = vigente

WorkoutSession
├── id
├── studentId          (FK → User)
├── sheetId            (FK → WorkoutSheet)
├── sheetNameSnapshot
├── startedAt
├── durationSeconds
└── status: COMPLETA | INTERROMPIDA

Goal
├── id
├── studentId          (FK → User)
├── professorId        (FK → User)
├── description
├── sheetId            // nullable
├── exerciseName       // nullable
└── status: EM_PROGRESSO | ATINGIDA
```

## **4.3 Exemplos de Estrutura de Ficha**

**Ficha por Repetições (Musculação – Treino A):**

| Bloco | Exercício | Séries | Repetições | Descanso |
| :---- | :---- | :---- | :---- | :---- |
| Principal | Supino Reto | 4 | 10 | 60s |
| Principal | Crossover | 3 | 12 | 45s |
| Principal | Tríceps Corda | 3 | 15 | 45s |

**Ficha por Tempo (HIIT):**

| Bloco | Exercício | Duração | Ciclos | Descanso entre ciclos |
| :---- | :---- | :---- | :---- | :---- |
| Principal | Corrida no lugar | 30s | 3 | 15s |
| Principal | Agachamento com salto | 30s | 3 | 15s |
| Principal | Burpees | 30s | 3 | 15s |

# **5. Considerações Finais**

## **5.1 Prioridade dos Requisitos – MoSCoW**

A priorização segue o método MoSCoW. As prioridades individuais estão indicadas nas tabelas das seções 3.1, 3.2 e 3.3. O resumo consolidado é:

| Categoria | Requisitos Funcionais | Requisitos Não Funcionais / Regras |
| :---- | :---- | :---- |
| **Must Have** | RF01 a RF05, RF08 a RF14 | RNF01 a RNF05, RNF07, RB01 a RB05, RB07, RB08 |
| **Should Have** | RF06, RF07, RF15 | RNF06, RB05, RB06 |
| **Could Have** | — | RB09 (ajuste de carga unificado) |
| **Won't Have (v1)** | Módulo financeiro · Integração com wearables · App mobile para professor · Push notifications externas | — |

## **5.2 Itens Pendentes de Decisão**

* **Cache offline no app:** O aluno deve conseguir visualizar a ficha sem internet (cache local)? Define se há necessidade de sincronização incremental.

* **Infraestrutura do IFF:** Confirmar disponibilidade e configuração do servidor para hospedar o backend e o banco MySQL.

* **Cadastro inicial:** O professor cadastra os alunos manualmente ou haverá importação em lote (ex.: planilha)?

* **Expiração de fichas:** Fichas atribuídas sem data de fim ficam vigentes indefinidamente — isso é o comportamento desejado?

* **Redefinição de senha:** O fluxo de reset de senha será por e-mail (OTP) ou por ação administrativa do professor?

## **5.3 Apêndice – Glossário Técnico**

* **WorkoutSheet:** Ficha de treino digital. Substitui a ficha física da academia. Contém blocos e séries definidos pelo professor.

* **SheetAssignment:** Vínculo entre uma ficha e um aluno. Controla a vigência (startDate / endDate) e determina o que o aluno vê no app.

* **WorkoutSession:** Registro de execução de uma ficha pelo aluno. Armazena snapshot do nome da ficha, evitando perda de referência em caso de exclusão da ficha original.

* **Soft Delete:** Técnica de exclusão lógica — o registro não é removido do banco, apenas marcado como inativo (active = false), preservando histórico e integridade referencial.

* **JWT (JSON Web Token):** Token de autenticação stateless com validade configurável, assinado com chave HMAC-SHA. Carrega o perfil (role) do usuário autenticado e protege as rotas da API.

* **ROLE\_PROFESSOR / ROLE\_ALUNO:** Perfis de acesso que determinam quais endpoints e funcionalidades cada tipo de usuário pode acessar no sistema.

* **In-App Notification:** Notificação exibida dentro da interface do aplicativo na tela de encerramento da sessão. Não utiliza push notifications externas (FCM/APNs).

* **Low-end:** Dispositivo Android com hardware de entrada — processador básico, RAM limitada (2GB ou menos) e armazenamento reduzido.

# **6. Métodos e Técnicas**

## **6.1 Entrevista**

O levantamento de requisitos foi conduzido por meio de entrevistas com profissionais de educação física do IFF. O processo seguiu as etapas:

* **Preparação:** Definição do público-alvo e elaboração de roteiro com os principais tópicos (gestão de fichas, distribuição para alunos, informações essenciais no treino).

* **Condução:** Entrevistas individuais com foco em entender o fluxo atual com fichas físicas e as dores do processo.

* **Documentação:** Registro dos pontos-chave: como as fichas são distribuídas, quais informações são essenciais e o que se espera de uma solução digital.

* Exemplo de resposta coletada: *"Cada aluno baixa o aplicativo no próprio celular e o professor configura as atividades de acordo com as necessidades individuais."*

## **6.2 Observação**

A equipe observou o ambiente da academia para identificar necessidades não capturadas em entrevistas:

* Como alunos e professores interagem com fichas físicas durante o treino

* Pontos de atrito: fichas rasgadas, ilegíveis ou esquecidas; dificuldade do aluno em lembrar a sequência de exercícios

* Necessidade de interface que não interrompa o fluxo do exercício

## **6.3 Análise de Aplicativos Concorrentes**

Foram analisados os aplicativos Fitify e Pacto como referência de mercado, identificando funcionalidades essenciais, abordagens de UX e pontos a evitar no TT IFF.