# **Documento de Especificação de Requisitos de Software (ERS / SRS)**

**Training Timer**  
Referência IEEE 830  
Versão 1.0.0
---

# **1\. Introdução**

## **1.1 Propósito:** 

Este documento descreve os requisitos do **TT – Training Timer**, uma plataforma para gestão e acompanhamento de treinos físicos personalizados e gerenciamento de alunos. O documento servirá como referência para desenvolvedores, testadores e futuros usuários, garantindo clareza quanto às funcionalidades esperadas, limitações e regras de negócio.

## **1.2 Escopo: O TT terá como objetivo:**

* **Ecossistema Híbrido:** Unificar a experiência de execução do aluno com a gestão técnica do Personal Trainer.
* **Autonomia e Inteligência:** Oferecer questionários para sugestão automática de treinos e acompanhamento de metas.
* **Conectividade Estendida:** Suporte a Smart Bands para monitoramento de frequência cardíaca e controle remoto do treino.
* **Resiliência Técnica:** Funcionamento Offline-First com sincronização em nuvem via Supabase.

## **1.3 Definições, Acrônimos e Abreviações:**

* **TT** – Training Timer  
* **CRUD** – criação, leitura, atualização e exclusão  
* **RB** – Regra de Negócio.  
* **RF** – Requisito Funcional.  
* **RNF** – Requisito Não Funcional.  
* **MVP** – Produto Mínimo Viável.

# **2\. Descrição Geral**

## **2.1 Perspectiva do Produto: Ecossistema TT**

O TT é dividido em três módulos principais de experiência dentro do mesmo App:
1. **Modo Autônomo:** Usuário comum gerencia seus próprios treinos e metas.
2. **Modo Personal:** Ferramentas de prescrição, gestão de alunos e análise de métricas.
3. **Modo Aluno (Guiado):** Interface simplificada focada exclusivamente na execução do que foi prescrito pelo Personal.

## **2.2 Funções do Produto:**

As principais funcionalidades do TT incluem:

* **CRUD de Treinos:** Criar, editar, visualizar e apagar (CRUD completo) treinos personalizados.  
* **Sugestão Inteligente:** Exibir treinos pré-prontos ou sugeridos com base nas respostas do questionário inicial.  
* **Exibição Essencial:** Mostrar informações cruciais de forma clara durante o exercício (nome, séries, repetições/tempo, descanso).  
* **Recursos de Execução:** Oferecer um cronômetro robusto, **sons de aviso** (início/fim do exercício) e controles de execução (pausar, pular ou retroceder exercício).  
* **Antecipação:** Permitir a visualização do **próximo exercício** durante o período de descanso.  
* **Histórico:** Registrar e consultar o histórico de treinos executados por data e métricas.  
* **Metas:** Definir, acompanhar e notificar o usuário quando metas de progresso forem atingidas.

## **2.3 Características dos Usuários:** 

O TT atenderá dois perfis principais de usuários, cada um com necessidades e níveis de autonomia distintos dentro do ecossistema:

* **Alunos:** Voltados para execução prática do treino. Buscam simplicidade, clareza e suporte durante a rotina.
* **Professores / Profissionais:** Responsáveis pela criação, organização e acompanhamento dos treinos dos alunos. Utilizam funcionalidades avançadas e dependem de acesso autenticado. 


## **2.4 Restrições:**

Estas restrições definem a qualidade técnica e o ambiente operacional do sistema:
* **Interface Imersiva:** No modo de execução, os elementos devem ser grandes para fácil visualização à distância.
* **Consumo de Bateria:** A integração com Smart Bands não deve comprometer a autonomia do dispositivo móvel.

## **2.5 Suposições e Dependências:**

* **Dependência Básica:** Usuários terão acesso a dispositivos móveis com recursos básicos de áudio e tela tátil.  
* **Sincronização em Nuvem:** A sincronização de dados e autenticação entre o App e o Back-end (sincronização em nuvem) **é um requisito de escopo desta fase do projeto**, visando a integração do ecossistema. Contudo, esta funcionalidade deve ser tratada como um recurso opcional e complementar, e não obrigatório para o uso básico e a execução do treino no App.

---

# **3\. Requisitos Específicos**

## **3.1 Requisitos Funcionais:**

| ID | Requisito Funcional | Descrição Detalhada | Prioridade |
| --- | --- | --- | --- |
| **RF01** | Sugestão de Treino | O sistema deve sugerir treinos pré-prontos com base num questionário inicial (objetivo/nível). | Must |
| **RF02** | Estrutura em Blocos | O sistema deve disponibilizar treinos organizados em blocos e séries (ex: Aquecimento, Principal). | Must |
| **RF03** | Organização em Pastas | O sistema deve permitir organizar treinos em pastas/categorias por objetivo (ex: Cardio, Hipertrofia). | Could |
| **RF04** | Importação/Exportação | O sistema deve possibilitar a importação e exportação de treinos entre utilizadores. | Could |
| **RF05** | CRUD de Treinos | O sistema deve permitir criar, ler, atualizar e eliminar treinos personalizados. | Must |
| **RF06** | Modos de Exercício | O sistema deve permitir definir exercícios por número de repetições ou por tempo (cronómetro). | Must |
| **RF07** | Feedback Sonoro | O sistema deve emitir sons para sinalizar mudanças de estado (início, descanso, término próximo). | Must |
| **RF08** | Controlo de Execução | O sistema deve permitir saltar, pausar ou retroceder exercícios durante o treino. | Must |
| **RF09** | Antecipação de Carga | O sistema deve exibir o próximo exercício durante o tempo de descanso. | Must |
| **RF10** | Início Rápido | O sistema deve exibir o primeiro exercício do treino imediatamente ao iniciar a execução. | Must |
| **RF11** | Mensagens Personalizadas | O sistema deve permitir configurar notas/mensagens que surgem em séries específicas. | Could |
| **RF12** | Ajuste de Carga Unificado | O sistema deve oferecer ajuste automático e unificado da carga de treino (tempo/reps). | Could |
| **RF13** | Registo de Histórico | O sistema deve registar o histórico de treinos executados com data e métricas de performance. | Should |
| **RF14** | Definição de Metas | O sistema deve permitir definir metas de progresso associadas a treinos ou exercícios. | Should |
| **RF15** | Notificação de Metas | O sistema deve notificar o utilizador (dentro da app) quando uma meta for atingida. | Should |
| **RF16** | Vínculo Personal-Aluno | O sistema deve permitir a conexão entre Personal e Aluno via código ou link de convite. | Must |
| **RF17** | Prescrição Remota | O sistema deve permitir que o Personal prescreva e atualize treinos diretamente no app do Aluno. | Must |
| **RF18** | Integração Wearable (RH) | O sistema deve exibir a frequência cardíaca em tempo real através de Smart Bands conectadas. | Should |
| **RF19** | Controlo via Wearable | O sistema deve permitir controlar o fluxo do treino (pausar/avançar) através do dispositivo vestível. | Could |
| **RF20** | Dashboards de Evolução | O sistema deve gerar gráficos de volume de carga, frequência e evolução física. | Should |
| **RF21** | Sincronização Cloud | O sistema deve sincronizar automaticamente os dados locais com a nuvem (Supabase) quando houver internet. | Must |
| **RF22** | Questionário de Saúde | O sistema deve permitir que o Personal visualize as respostas do questionário de saúde/objetivos do Aluno. | Must |

## **3.2 Requisitos Não Funcionais:** 

| ID | Categoria | Descrição do Requisito | Prioridade |
| --- | --- | --- | --- |
| **RNF01** | Usabilidade | O sistema deve possuir navegação simples e intuitiva para não interromper o fluxo do treino. | **Must** |
| **RNF02** | Desempenho | O sistema deve ser leve e rápido, otimizado para dispositivos Android de entrada (*low-end*). | **Must** |
| **RNF03** | Interface | O sistema deve apresentar uma interface limpa, com elementos visuais de fácil percepção e suporte a Temas (Claro/Escuro). | **Must** |
| **RNF04** | Ética/UX | O sistema não deve exibir anúncios intrusivos que atrapalhem ou limitem a execução do exercício. | **Must** |
| **RNF05** | Disponibilidade | O sistema deve permitir o uso básico e a execução de treinos sem necessidade de login ou acesso à internet. | **Must** |
| **RNF06** | Confiabilidade | O sistema deve garantir que os dados registados localmente sejam preservados em caso de fecho inesperado da aplicação. | **Must** |
| **RNF07** | Escalabilidade | A arquitetura deve permitir a transição fluida entre o "Modo Aluno" e o "Modo Personal" dentro da mesma aplicação. | **Should** |
| **RNF08** | Sincronização | A sincronização de dados com a nuvem deve ocorrer em segundo plano sem impactar a performance da interface (UI). | **Should** |
| **RNF09** | Portabilidade | Os dados de treino e perfil devem ser facilmente restaurados ao realizar login num novo dispositivo. | **Should** |
| **RNF10** | Acessibilidade | O sistema deve suportar sinais sonoros e vibração para guiar o utilizador sem necessidade de olhar para o ecrã. | **Should** |
| **RNF11** | Segurança | Apenas o Personal Trainer vinculado deve ter permissão para visualizar e editar os dados de progresso dos seus alunos. | **Must** |
| **RNF12** | Interoperabilidade | O sistema deve ser capaz de comunicar com dispositivos *wearables* via Bluetooth Low Energy (BLE) para leitura de batimentos. | **Should** |

## **3.3 Regras de Negócio:** 

| ID | Regra de Negócio | Descrição Detalhada |
| --- | --- | --- |
| **RB01** | Filtro de Sugestão | O questionário inicial deve determinar obrigatoriamente quais treinos pré-prontos serão sugeridos ao utilizador, filtrando por objetivo (ex: hipertrofia) e nível (ex: iniciante). |
| **RB02** | Ajuste Inteligente de Carga | A alteração da carga geral do treino deve ajustar automaticamente todos os exercícios vinculados, aumentando ou diminuindo repetições (+/-1) ou tempo (+/-60s) proporcionalmente. |
| **RB03** | Individualidade de Metas | As metas definidas devem ser acompanhadas e validadas individualmente por cada treino ou exercício específico para garantir a precisão da evolução. |
| **RB04** | Notificações Locais | As notificações de metas atingidas ou lembretes de treino devem ocorrer estritamente dentro do aplicativo, sem dependência de serviços de *push* externos (Firebase/APNs) para garantir o funcionamento offline. |
| **RB05** | Hierarquia de Edição | No "Modo Aluno", o utilizador está impedido de alterar a estrutura técnica do treino (exercícios, ordens, blocos) definida pelo Personal Trainer, podendo apenas editar os dados de execução (carga e repetições feitas). |
| **RB06** | Exclusividade de Vínculo | Cada Aluno pode estar vinculado a apenas um Personal Trainer de cada vez para evitar conflitos de prescrição e sobreposição de fichas de treino. |
| **RB07** | Validação de Sincronização | Em caso de conflito de dados (edição offline em dois dispositivos diferentes), o sistema deve aplicar a regra de "A última escrita vence" (*Last Write Wins*) baseada no *timestamp* do dispositivo. |
| **RB08** | Ciclo de Vida do Treino | O Personal Trainer pode definir uma data de expiração para uma ficha de treino; após essa data, o sistema deve alertar tanto o Personal quanto o Aluno sobre a necessidade de renovação da prescrição. |
| **RB09** | Privacidade de Métricas | Os dados detalhados de saúde e evolução de um Aluno só ficam visíveis para o Personal Trainer após a aceitação formal do convite de conexão dentro do ecossistema. |

---

# **4\. Modelos e Diagramas de Apoio**

## **4.1 Diagrama de Casos de Uso:** 

## **4.2 Diagramas de Classes ou Entidades:** 

---

# **5\. Métodos e Técnicas** 

## **Entrevista:** 

O processo seguiu as seguintes etapas:

* **Preparação:** Antes das entrevistas, a equipe definiu o público-alvo (potenciais usuários do aplicativo) e elaborou um roteiro com os principais tópicos a serem abordados. Esse roteiro serviu como um guia para garantir que todas as áreas relevantes fossem exploradas.  
* **Condução:** As entrevistas foram realizadas individualmente para permitir que cada participante se sentisse confortável em expressar suas opiniões. Durante a conversa, a equipe incentivou os usuários a descreverem suas rotinas de treino, os desafios que enfrentam e o que esperariam de um aplicativo de gerenciamento de exercícios. O foco foi em ouvir ativamente e fazer perguntas abertas para capturar *insights* valiosos sobre os hábitos e necessidades.  
* **Documentação:** As informações e os feedbacks mais importantes foram registrados, destacando pontos-chave como funcionalidades desejadas, possíveis dificuldades e sugestões de melhoria. Esses registros foram fundamentais para a próxima fase de análise e organização dos requisitos coletados.  
* **Algumas das perguntas feitas:**  
  * **1\. Como você controla e distribui fichas para diferentes alunos?** “Como eles (a academia) usam app, cada aluno baixa em seu próprio aparelho de telefone o aplicativo, eu só configuro as atividades que por ele (aluno) será feita de acordo com as necessidades do aluno.”  
  * **2\. Que tipo de informações são mais importantes em uma ficha de treino (ex: exercícios, séries, carga, tempo de descanso)?** “Os exercícios a serem realizados no dia (ex: treino A, treino B ou treino C) a carga e as repetições,  o tempo de descanso é o mesmo para todos, 30 segundos.”

## **Observação:**

O método de observação foi crucial para entender o contexto real de uso do aplicativo. A equipe observou o ambiente da academia para identificar necessidades e pontos problemáticos que não seriam capturados apenas em entrevistas.

* **Ambiente e Interação**: A equipe observou como as pessoas interagem com seus treinos, com os equipamentos e com as ferramentas digitais disponíveis.  
* **Insights Coletados**: Essa abordagem permitiu identificar a necessidade de um uso **offline** e uma interface simples que não interrompa o fluxo do exercício.  
* **Propósito**: As observações serviram como ponto de referência para derivar funcionalidades essenciais para o aplicativo.

## **Estudo de Documentação:** 

A equipe realizou uma análise aprofundada de materiais relevantes para o projeto, focando em diferentes tipos de documentos para obter uma visão completa.

* **Análise de Aplicativos**: O foco principal foi o estudo de **aplicativos de treino existentes** para identificar suas funcionalidades, pontos fortes e fracos, e as abordagens de *design* e usabilidade no mercado.  
* **Consulta a Referências**: Foram consultados documentos de referência como artigos, fóruns e *blogs* (listados nas referências do documento).  
* **Entendimento do Usuário**: O estudo foi feito para entender as expectativas e as "dores" da comunidade de usuários de aplicativos de treino.  
* **Resultado**: Esse estudo comparativo foi fundamental para a definição do escopo do **Training Timer (TT)**, garantindo que o aplicativo fosse competitivo e alinhado às necessidades do público-alvo.

## **Prototipação:** 

O processo de prototipação foi conduzido em etapas para validar as funcionalidades de forma iterativa, com base no *feedback* dos usuários.

* **Protótipo Visual**: Inicialmente, a equipe criou um protótipo visual para testar e validar o *design* da interface do usuário do **Training Timer (TT)**.  
* **Protótipo Funcional**: Com o *feedback* do protótipo visual, foi desenvolvido o **primeiro protótipo funcional**. Ele incluía as funcionalidades essenciais de **criação, leitura, atualização e exclusão (CRUD)** de treinos e a execução dos mesmos.  
* **Desenvolvimento do MVP**: A partir desse protótipo funcional e dos requisitos obtidos em outras etapas, a equipe construiu o **primeiro MVP (Produto Mínimo Viável)**. Este MVP foi elaborado para conter o conjunto mínimo de funcionalidades que poderiam ser comercializadas e oferecer valor ao usuário, garantindo que o produto final fosse robusto e alinhado às expectativas do mercado.
