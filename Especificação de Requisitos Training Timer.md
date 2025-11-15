# **Documento de Especificação de Requisitos de Software (ERS / SRS)**

**Training Timer**  
Conforme IEEE 830  
---

# **1\. Introdução**

## **1.1 Propósito:** 

Este documento descreve os requisitos do **TT – Training Timer**, uma plataforma para gestão e acompanhamento de treinos físicos personalizados. O documento servirá como referência para desenvolvedores, testadores e futuros usuários, garantindo clareza quanto às funcionalidades esperadas, limitações e regras de negócio.

## **1.2 Escopo: O TT terá como objetivo:**

* **Personalização:** Oferecer treinos personalizados a partir de questionários iniciais detalhados.  
* **Estrutura do Treino:** Disponibilizar treinos organizados em blocos e séries, utilizando a ficha de treino alfabeto.  
* **Acompanhamento:** Registrar histórico de treinos e acompanhar metas de progresso com indicadores de evolução.  
* **Usabilidade:** Fornecer recursos auxiliares durante a execução do treino (sons, notificações, mensagens personalizadas).  
* **Performance (App):** Garantir experiência simples, leve, e sem necessidade obrigatória de login ou internet (apenas o App).  
* **Gestão Profissional:** Oferecer ferramentas de gestão de alunos dedicadas a academias e profissionais (Personal Trainer).

## **1.3 Definições, Acrônimos e Abreviações:**

* **TT** – Training Timer  
* **CRUD** – criação, leitura, atualização e exclusão  
* **RB** – Regra de Negócio.  
* **RF** – Requisito Funcional.  
* **RNF** – Requisito Não Funcional.  
* **MVP** – Produto Mínimo Viável.

## **1.4 Referências:**

**Aplicativos analisados:** Estes aplicativos serviram como referência de mercado para a identificação de funcionalidades, abordagens de design e usabilidade.

* [https://play.google.com/store/apps/details?id=com.fitifyworkouts.bodyweight.workoutapp](https://play.google.com/store/apps/details?id=com.fitifyworkouts.bodyweight.workoutapp)  
* [https://play.google.com/store/apps/details?id=com.pacto](https://play.google.com/store/apps/details?id=com.pacto)

**Fontes das pesquisas:** Esses links de fóruns, blogs e comunidades online foram utilizados para **entender as expectativas e os desafios** dos usuários de aplicativos de treino, fornecendo insights diretos sobre suas necessidades e pontos problemáticos.

* [https://www.reddit.com/r/Maromba/comments/1j2h1lk/app\_pra\_gerenciar\_pr%C3%B3prio\_treino/](https://www.reddit.com/r/Maromba/comments/1j2h1lk/app_pra_gerenciar_pr%C3%B3prio_treino/)  
* [https://www.reddit.com/r/Gravl/comments/1jfsrhp/como\_deixar\_os\_treinos\_organizados/](https://www.reddit.com/r/Gravl/comments/1jfsrhp/como_deixar_os_treinos_organizados/)  
* [https://www.reddit.com/r/Maromba/comments/1c7gjf7/recomenda%C3%A7%C3%A3o\_de\_aplicativo\_de\_ficha\_de\_treino/](https://www.reddit.com/r/Maromba/comments/1c7gjf7/recomenda%C3%A7%C3%A3o_de_aplicativo_de_ficha_de_treino/)  
* [https://www.reddit.com/r/Maromba/comments/12imwkm/aplicativo\_que\_monta\_treino\_pra\_mim/](https://www.reddit.com/r/Maromba/comments/12imwkm/aplicativo_que_monta_treino_pra_mim/)  
* [https://blog.nextfit.com.br/aplicativo-para-treino-academia/](https://blog.nextfit.com.br/aplicativo-para-treino-academia/)  
* [https://www.reddit.com/r/Maromba/comments/1etmpyi/sugest%C3%A3o\_de\_aplicativo\_gratuito\_para/](https://www.reddit.com/r/Maromba/comments/1etmpyi/sugest%C3%A3o_de_aplicativo_gratuito_para/)  
* [https://www.hipertrofia.org/forum/topic/266748-como-voc%C3%AAs-organizam-fichas-programas-de-treinamento](https://www.hipertrofia.org/forum/topic/266748-como-voc%C3%AAs-organizam-fichas-programas-de-treinamento)  
* [https://www.reddit.com/r/Maromba/comments/xr7wgm/apps\_de\_organiza%C3%A7%C3%A3o\_de\_treino/](https://www.reddit.com/r/Maromba/comments/xr7wgm/apps_de_organiza%C3%A7%C3%A3o_de_treino/)  
* [https://www.reddit.com/r/Maromba/comments/17s7q0p/vale\_a\_pena\_usar\_app\_de\_treino\_na\_academia/](https://www.reddit.com/r/Maromba/comments/17s7q0p/vale_a_pena_usar_app_de_treino_na_academia/)

## **1.5 Visão Geral do Documento:** 

Organizado em introdução, descrição geral, requisitos funcionais e não funcionais, diagramas, considerações finais e métodos e técnicas.

---

# **2\. Descrição Geral**

## **2.1 Perspectiva do Produto: Ecossistema TT**

O TT é um **ecossistema digital** composto por um **Aplicativo Mobile (para execução)** e um **Portal Web (para gestão)**, suportados por um Backend Central. O foco do sistema é na **simplicidade** e na **praticidade** para o usuário final durante o treino.

| Componente | Foco Principal | Restrições Chave |
| :---: | ----- | ----- |
| **App Mobile** | Execução do treino (timer), histórico e autonomia. | Pode ser usado **offline** e **sem necessidade de login obrigatório** para uso básico. |
| **Portal Web** | Criação de treinos, gestão de alunos e relatórios avançados (acesso profissional). | Requer conexão à internet e login para gestão de dados. |

O TT permitirá as seguintes funcionalidades em nível de sistema:

* **Estruturação:** Organização dos treinos em blocos e séries (aquecimento, principal, aeróbico, alongamento, etc.).  
* **Gestão de Treinos:** Importação, exportação e configuração rápida de treinos pré-prontos e personalizados.  
* **Ajuste Inteligente:** **Ajuste automático de parâmetros de carga** do treino (tempo, repetições ou descanso), baseado em regras pré-definidas.  
* **Acompanhamento:** Registro do histórico de execução e acompanhamento da evolução através de indicadores.

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

Os usuários serão categorizados conforme a sua necessidade de autonomia e profundidade na gestão do treino:

* **Iniciantes:** Buscam treinos prontos e interface intuitiva. Valorizam instruções visuais e sonoras claras.  
* **Intermediários:** Buscam a personalização de blocos, séries e cargas. Valorizam o registro de histórico e o acompanhamento de metas.  
* **Avançados / Profissionais:** Focam na evolução detalhada, buscam autonomia total na criação/ajuste e utilizam a funcionalidade de importação/exportação de treinos.

## **2.4 Restrições:**

Estas restrições definem a qualidade técnica e o ambiente operacional do sistema:

* **Performance do App:** O aplicativo deve funcionar em dispositivos Android de entrada (low-end), com baixo consumo de memória e bateria.  
* **Conectividade:** O uso básico e a execução do treino não devem depender de conexão à internet. A sincronização de dados e a gestão de alunos requerem conexão.  
* **Monetização:** Não deve exibir anúncios que prejudiquem ou interrompam a execução do treino.  
* **UX/Velocidade:** A interface deve ser limpa, intuitiva e o tempo de resposta das transições e ações deve ser minimizado.

## **2.5 Suposições e Dependências:**

* **Dependência Básica:** Usuários terão acesso a dispositivos móveis com recursos básicos de áudio e tela tátil.  
* **Sincronização em Nuvem:** A sincronização de dados e autenticação entre o App e o Portal Web (sincronização em nuvem) **é um requisito de escopo desta fase do projeto**, visando a integração do ecossistema. Contudo, esta funcionalidade deve ser tratada como um recurso opcional e complementar, e não obrigatório para o uso básico e a execução do treino no App.

---

# **3\. Requisitos Específicos**

## **3.1 Requisitos Funcionais:**

* **RF01** – O sistema deve criar treinos pré-prontos e personalizados para o usuário, com base nas respostas a um questionário inicial.  
* **RF02** – O sistema deve disponibilizar treinos separados em blocos, e dentro dos blocos em séries.  
* **RF03** – O sistema deve permitir a organização dos treinos em pastas, de acordo com o objetivo do usuário.  
* **RF04** – O sistema deve possibilitar importar e exportar treinos.  
* **RF05** – O sistema deve permitir **CRUD** de treinos personalizados.  
* **RF06** – O sistema deve permitir definir exercícios por tempo ou por número de repetições.  
* **RF07** – O sistema deve emitir sons para sinalizar mudanças de estado (exercício, aviso de término próximo, descanso).  
* **RF08** – O sistema deve permitir pular, pausar ou retroceder exercícios durante a execução.  
* **RF09** – O sistema deve exibir o próximo exercício durante a tela de descanso.  
* **RF10** – O sistema deve exibir o primeiro exercício do treino na tela inicial da execução.  
* **RF11** – O sistema deve permitir configurar mensagens personalizadas que serão exibidas em cada série.  
* **RF12** – O sistema deve oferecer ajuste unificado e automático da carga do treino.  
* **RF13** – O sistema deve registrar histórico dos treinos executados, com data de execução.  
* **RF14** – O sistema deve permitir definição de metas de progresso, associadas a treinos ou exercícios.  
* **RF15** – O sistema deve notificar o usuário quando uma meta for atingida (notificação dentro do app).

## **3.2 Requisitos Não Funcionais:** 

* **RNF01** – O sistema deve possuir navegação simples e intuitiva.  
* **RNF02** – O sistema deve ser leve e rápido, adequado para dispositivos de entrada.  
* **RNF03** – O sistema deve apresentar interface limpa, com elementos de fácil percepção.  
* **RNF04** – O sistema não deve exibir anúncios intrusivos; caso existam, não podem atrapalhar ou limitar o uso.  
* **RNF05** – O sistema deve funcionar sem necessidade de login ou acesso à internet.

## **3.3 Regras de Negócio:** 

* **RB01 –** O questionário inicial deve determinar quais treinos pré-prontos serão sugeridos ao usuário.  
* **RB02 –** A alteração da carga geral do treino deve ajustar automaticamente todos os exercícios vinculados, aumentando ou diminuindo repetições (+/-1) ou tempo (+/-60s).  
* **RB03 –** As metas definidas devem ser acompanhadas individualmente por treino ou exercício.  
* **RB04 –** As notificações de metas atingidas devem ocorrer apenas dentro do aplicativo (sem push externo).

---

# **4\. Modelos e Diagramas de Apoio**

## **4.1 Diagrama de Casos de Uso:** 

## **4.2 Diagramas de Classes ou Entidades:** 

---

# **5\. Considerações Finais** 

## **5.1 Prioridade dos Requisitos:** 

* **M (Must Have):** RF01, RF02, RF05, RF06, RF07, RF08, RF09, RF10, RNF01, RNF03, RNF05, RNF02, RB01.  
* **S (Should Have):** RF13, RF14, RF15, RB03.  
* **C (Could Have):** RF03, RF04, RF11, RF12, RNF04, RB02, RB04.  
* **W (Won't Have):** (Nenhum nesta versão)

## **5.2 Apêndices:**

### **Glossário:**

* **TT (Training Timer): Ecossistema digital** composto por um **App Mobile** (para execução de treinos) e um **Portal Web** (para gestão de alunos e criação de treinos), focado em treinos personalizados e acompanhamento de metas. O uso básico do App mantém a característica de simplicidade e funcionalidade offline.  
* **Treinos em Blocos e Séries:** Estrutura fundamental de organização da **Ficha de Treino**. Os **Blocos** dividem o treino em seções lógicas (ex: Aquecimento, Principal, Aeróbicos) e as **Séries** definem o padrão de repetições ou tempo de execução do exercício, garantindo flexibilidade e versatilidade para diversas modalidades (musculação, aeróbicos, etc.)**.**

### **Exemplos de Aplicação da Estrutura de Treino:**

Para ilustrar a versatilidade da estrutura de **Blocos e Séries** dentro de uma **Ficha de Treino**, seguem dois exemplos distintos que o ecossistema TT deve suportar:

### **1\. Exemplo de Treino por Repetição (Musculação – Foco na Carga)**

Este exemplo simula um Bloco Principal de um treino alfabético (ex: Treino A), onde a execução e o acompanhamento se baseiam na contagem de repetições e carga registrada.

| Série (Ordem) | Exercício | Séries | Repetições | Descanso (Implícito) |
| :---: | :---: | :---: | :---: | :---: |
| **Série 1** | Supino Reto | 4 | 10 | 60 segundos |
| **Série 2** | Crossover | 3 | 12 | 45 segundos |
| **Série 3** | Tríceps Corda | 3 | 15 | 45 segundos |

### **2\. Exemplo de Treino por Tempo (HIIT/Aeróbico – Foco no Ritmo)**

Este exemplo simula um bloco de treino baseado no tempo de execução, comum em treinos de alta intensidade (HIIT) ou funcionais.

| Série (Ordem) | Exercício | Duração (Execução) | Séries (Ciclos) | Descanso (Entre Séries) |
| :---: | :---: | :---: | :---: | :---: |
| **Série 1** | Corrida no lugar | 30 segundos | 3 | 15 segundos |
| **Série 2** | Agachamento com salto | 30 segundos | 3 | 15 segundos |
| **Série 3** | Burpees | 30 segundos | 3 | 15 segundos |

---

# **6\. Métodos e Técnicas** 

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