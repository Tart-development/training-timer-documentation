**Documento de Especificação de**

**Requisitos de Software (ERS / SRS)**

**Training Timer – TT Local (Aplicativo Mobile Autônomo)**

*Conforme IEEE 830*

| Sistema | TT Local – Aplicativo Mobile de Treino Autônomo |
| :---- | :---- |
| **Produto** | Training Timer – Produto 1 |
| **Versão** | 1.0 |
| **Data** | Novembro de 2025 |
| **Status** | Em planejamento |

# **1. Introdução**

## **1.1 Propósito**

Este documento descreve os requisitos do TT Local, Produto 1 do ecossistema Training Timer. O sistema é um aplicativo mobile autônomo voltado para usuários que desejam criar e executar seus próprios treinos diretamente no dispositivo, sem necessidade de conta, servidor ou conexão com a internet. O documento servirá como referência para desenvolvedores, testadores e demais envolvidos, garantindo clareza quanto às funcionalidades esperadas, limitações e regras de negócio.

## **1.2 Escopo**

O TT Local terá como objetivo:

* Permitir ao usuário criar, editar e gerenciar treinos personalizados inteiramente no dispositivo

* Conduzir a execução de treinos com timer, sons de aviso e controles de sessão

* Registrar o histórico local de treinos realizados

* Operar 100% offline, sem nenhuma dependência de rede ou autenticação

## **1.3 Definições, Acrônimos e Abreviações**

Para o mapeamento completo entre termos do documento e termos do código, consulte a seção 1.6 – Glossário de Nomenclatura.

* **TT –** Training Timer — nome do ecossistema digital

* **TT Local –** Produto 1: aplicativo mobile autônomo, sem backend

* **RF –** Requisito Funcional

* **RNF –** Requisito Não Funcional

* **RB –** Regra de Negócio

* **MVP –** Produto Mínimo Viável

## **1.4 Referências**

* IEEE Std 830-1998: Recommended Practice for Software Requirements Specifications

* Aplicativos analisados como referência de mercado:
  * Fitify: https://play.google.com/store/apps/details?id=com.fitifyworkouts.bodyweight.workoutapp
  * Pacto: https://play.google.com/store/apps/details?id=com.pacto

## **1.5 Visão Geral do Documento**

Organizado em: introdução e glossário de nomenclatura, descrição geral, requisitos funcionais e não funcionais, regras de negócio, modelos de apoio e considerações finais com priorização MoSCoW.

## **1.6 Glossário de Nomenclatura**

| Termo no Documento | Termo no Código | Descrição |
| :---- | :---- | :---- |
| Treino | Workout | Conjunto de blocos criado e gerenciado pelo usuário no dispositivo. |
| Bloco | WorkoutBlock | Seção lógica de um treino (ex.: Aquecimento, Principal, Aeróbico). |
| Série | ExerciseSet | Unidade de execução de um exercício dentro de um bloco, com tipo, valor e descanso. |
| Sessão | WorkoutSession | Registro de uma execução de treino, completa ou interrompida, salvo no histórico local. |
| Tipo de exercício | ExerciseType | Enum que define se a série é executada por TEMPO (segundos) ou por REPETICOES (quantidade). |

# **2. Descrição Geral**

## **2.1 Perspectiva do Produto**

O TT Local é um aplicativo mobile stand-alone. Todos os dados — treinos criados, configurações e histórico de sessões — são persistidos exclusivamente no armazenamento local do dispositivo (AsyncStorage ou SQLite). Não há comunicação com servidores externos, login ou sincronização em nuvem.

**Stack tecnológica:** React Native (TypeScript).

## **2.2 Funções do Produto**

* **Gerenciamento de treinos:** CRUD completo de treinos personalizados, organizados em blocos e séries

* **Execução guiada:** Condução do treino com timer, transições automáticas entre exercícios e sons de aviso

* **Controles de sessão:** Pausar, pular ou retroceder exercícios durante a execução

* **Antecipação:** Exibição do próximo exercício durante o período de descanso

* **Histórico local:** Registro automático de cada sessão com data e duração

## **2.3 Características dos Usuários**

* **Iniciante:** Busca criar treinos simples e seguir a execução guiada sem configuração complexa

* **Intermediário:** Personaliza blocos, séries e cargas; consulta histórico para acompanhar evolução

* **Avançado:** Explora toda a flexibilidade de estruturação e acompanhamento local

Existe apenas um tipo de usuário — sem perfis diferenciados ou restrições de acesso entre funcionalidades.

## **2.4 Restrições**

* O aplicativo deve funcionar inteiramente sem conexão à internet

* Não há login, cadastro ou qualquer forma de autenticação

* O app deve operar adequadamente em dispositivos Android de entrada (low-end), com baixo consumo de memória e bateria

* O app não deve exibir anúncios de qualquer natureza

## **2.5 Suposições e Dependências**

* O usuário dispõe de um dispositivo móvel com tela tátil e recursos básicos de áudio

* O armazenamento local do dispositivo é suficiente para persistir treinos e histórico

* Não há dependência de bibliotecas de terceiros que exijam conexão para funcionar

* Atualizações do aplicativo via loja (Google Play) não impactam os dados locais existentes

# **3. Requisitos Específicos**

## **3.1 Requisitos Funcionais**

| ID | Descrição | Prioridade (MoSCoW) |
| :---- | :---- | :---- |
| **RF01** | O sistema deve permitir que treinos sejam organizados em blocos e que cada bloco contenha séries de exercícios. | **Must Have** |
| **RF02** | O sistema deve permitir CRUD completo de treinos personalizados (criar, visualizar, editar e excluir). | **Must Have** |
| **RF03** | O sistema deve permitir configurar cada série por tempo (segundos) ou por número de repetições, com tempo de descanso associado. | **Must Have** |
| **RF04** | O sistema deve emitir sons distintos ao iniciar um exercício, ao sinalizar término próximo e ao iniciar o período de descanso. | **Must Have** |
| **RF05** | O sistema deve oferecer controles de execução: pausar/retomar, pular para o próximo exercício e retroceder ao anterior. | **Must Have** |
| **RF06** | O sistema deve exibir o próximo exercício durante o período de descanso entre séries. | **Must Have** |
| **RF07** | O sistema deve exibir o primeiro exercício do treino antes de iniciar a contagem, permitindo que o usuário confirme o início. | **Must Have** |
| **RF08** | O sistema deve registrar automaticamente cada sessão executada com nome do treino, data/hora de início, duração total e status (completa ou interrompida). | **Should Have** |

## **3.2 Requisitos Não Funcionais**

| ID | Descrição | Prioridade (MoSCoW) |
| :---- | :---- | :---- |
| **RNF01** | A interface deve ser simples e intuitiva, sem necessidade de tutoriais ou treinamento prévio. | **Must Have** |
| **RNF02** | O app deve ser leve e responsivo em dispositivos Android de entrada (low-end). | **Must Have** |
| **RNF03** | A UI deve ser limpa, com elementos de alta legibilidade durante a execução do treino (fonte mínima 16sp nas telas de execução). | **Must Have** |
| **RNF04** | Todas as funcionalidades devem operar sem conexão à internet — zero chamadas de rede em qualquer fluxo. | **Must Have** |
| **RNF05** | Nenhum dado do usuário deve ser transmitido a servidores externos. | **Must Have** |
| **RNF06** | Os sons de aviso devem ser audíveis com volume moderado do dispositivo. | **Should Have** |

## **3.3 Regras de Negócio**

| ID | Descrição | Prioridade (MoSCoW) |
| :---- | :---- | :---- |
| **RB01** | Um treino só pode ser iniciado se possuir ao menos um bloco com uma série configurada. Treinos incompletos exibem aviso ao usuário e têm o início bloqueado. | **Must Have** |
| **RB02** | Dentro de um mesmo bloco, diferentes séries podem ter tipos distintos (uma por tempo, outra por repetições). A configuração de tipo é por série, não por bloco ou treino. | **Must Have** |
| **RB03** | Ao excluir um treino, o histórico de sessões associadas é mantido, identificado pelo nome do treino no momento da execução. | **Should Have** |
| **RB04** | Todos os dados (treinos, configurações e histórico) são armazenados exclusivamente no dispositivo. O app não realiza nenhuma operação de leitura ou escrita em servidores remotos. | **Must Have** |

# **4. Modelos e Diagramas de Apoio**

## **4.1 Diagrama de Casos de Uso**

A ser elaborado. O único ator é o Usuário. Os casos de uso prioritários são: Criar Treino, Executar Treino, Consultar Histórico e Configurar Série.

## **4.2 Estrutura de Dados – Modelo Conceitual**

```
Workout
├── id
├── name
├── createdAt
├── updatedAt
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

WorkoutSession
├── id
├── workoutNameSnapshot
├── startedAt
├── durationSeconds
└── status: COMPLETA | INTERROMPIDA
```

## **4.3 Exemplos de Estrutura de Treino**

**Treino por Repetições (Musculação):**

| Bloco | Exercício | Séries | Repetições | Descanso |
| :---- | :---- | :---- | :---- | :---- |
| Principal | Supino Reto | 4 | 10 | 60s |
| Principal | Crossover | 3 | 12 | 45s |
| Principal | Tríceps Corda | 3 | 15 | 45s |

**Treino por Tempo (HIIT):**

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
| **Must Have** | RF01 a RF07 | RNF01 a RNF05, RB01, RB02, RB04 |
| **Should Have** | RF08 | RNF06, RB03 |
| **Could Have** | Ajuste automático de carga · Mensagens personalizadas por série | — |
| **Won't Have (v1)** | Login · Sincronização em nuvem · Gestão de alunos | — |

## **5.2 Itens Pendentes de Decisão**

* **Armazenamento local:** Usar AsyncStorage ou SQLite? A decisão impacta a complexidade de queries no histórico.

* **Suporte a iOS:** O MVP é focado em Android. iOS é desejável mas não está no escopo inicial — confirmar com a equipe.

* **Sons:** Usar sons nativos do dispositivo ou áudio customizado embutido no app?

## **5.3 Apêndice – Glossário Técnico**

* **Workout:** Treino criado pelo usuário. Contém um nome, data de criação e uma lista ordenada de WorkoutBlocks.

* **WorkoutBlock:** Seção lógica de um treino (ex.: Aquecimento, Principal). Contém uma lista ordenada de ExerciseSets.

* **ExerciseSet:** Unidade mínima de execução. Define o exercício, tipo (TEMPO ou REPETICOES), valor e descanso.

* **WorkoutSession:** Registro de uma execução de treino persistido localmente. Armazena snapshot do nome do treino, horário, duração e status.

* **AsyncStorage:** Mecanismo de armazenamento chave-valor assíncrono nativo do React Native. Indicado para volumes menores de dados.

* **SQLite:** Banco de dados relacional embarcado, disponível no React Native via bibliotecas como `expo-sqlite`. Indicado para queries mais complexas (ex.: filtros de histórico).

# **6. Métodos e Técnicas**

## **6.1 Pesquisa com Usuários**

O levantamento de necessidades foi conduzido por meio de análise de comunidades online (Reddit r/Maromba, fóruns de hipertrofia) e entrevistas informais com praticantes de academia, mapeando dores recorrentes com aplicativos existentes:

* Interfaces pesadas e lentas em aparelhos de entrada

* Dependência obrigatória de internet e login para uso básico

* Anúncios que interrompem o treino

## **6.2 Análise de Aplicativos Concorrentes**

Foram analisados os aplicativos Fitify e Pacto como referência de mercado, identificando funcionalidades essenciais, abordagens de UX e pontos a evitar no TT Local.