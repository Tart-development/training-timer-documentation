# **Documento de Especificação de Requisitos de Software (ERS / SRS)**

## **Training Timer**

**Conforme IEEE 830**

---

# 1. Introdução

## 1.1 Propósito

Este documento descreve os requisitos do **TT – Training Timer**, um aplicativo mobile para gestão e acompanhamento de treinos físicos personalizados. O documento servirá como referência para desenvolvedores, testadores e futuros usuários, garantindo clareza quanto às funcionalidades esperadas, limitações e regras de negócio.

## 1.2 Escopo

O TT terá como objetivo:

* Oferecer treinos personalizados a partir de questionários iniciais.
* Disponibilizar treinos organizados em blocos e séries, utilizando treino alfabeto.
* Registrar histórico de treinos e evolução do usuário.
* Fornecer recursos auxiliares durante a execução do treino (sons, notificações, mensagens personalizadas).
* Permitir acompanhamento de metas de progresso e indicadores de evolução.
* Garantir experiência simples, leve, sem necessidade obrigatória de login ou internet.

## 1.3 Definições, Acrônimos e Abreviações

* **TT** – Training Timer
* **CRUD** – criação, leitura, atualização e exclusão
* **RB** – Regra de Negócio
* **RF** – Requisito Funcional
* **RNF** – Requisito Não Funcional
* **MVP** – Produto Mínimo Viável

## 1.4 Referências

**Aplicativos analisados:** Estes aplicativos serviram como referência de mercado para a identificação de funcionalidades, abordagens de design e usabilidade.

* [https://play.google.com/store/apps/details?id=com.fitifyworkouts.bodyweight.workoutapp](https://play.google.com/store/apps/details?id=com.fitifyworkouts.bodyweight.workoutapp)
* [https://play.google.com/store/apps/details?id=com.pacto](https://play.google.com/store/apps/details?id=com.pacto)

**Fontes das pesquisas:** Esses links de fóruns, blogs e comunidades online foram utilizados para entender as expectativas e os desafios dos usuários de aplicativos de treino, fornecendo insights diretos sobre suas necessidades e pontos problemáticos.

* [https://www.reddit.com/r/Maromba/comments/1j2h1lk/app_pra_gerenciar_pr%C3%B3prio_treino/](https://www.reddit.com/r/Maromba/comments/1j2h1lk/app_pra_gerenciar_pr%C3%B3prio_treino/)
* [https://www.reddit.com/r/Gravl/comments/1jfsrhp/como_deixar_os_treinos_organizados/](https://www.reddit.com/r/Gravl/comments/1jfsrhp/como_deixar_os_treinos_organizados/)
* [https://www.reddit.com/r/Maromba/comments/1c7gjf7/recomenda%C3%A7%C3%A3o_de_aplicativo_de_ficha_de_treino/](https://www.reddit.com/r/Maromba/comments/1c7gjf7/recomenda%C3%A7%C3%A3o_de_aplicativo_de_ficha_de_treino/)
* [https://www.reddit.com/r/Maromba/comments/12imwkm/aplicativo_que_monta_treino_pra_mim/](https://www.reddit.com/r/Maromba/comments/12imwkm/aplicativo_que_monta_treino_pra_mim/)
* [https://blog.nextfit.com.br/aplicativo-para-treino-academia/](https://blog.nextfit.com.br/aplicativo-para-treino-academia/)
* [https://www.reddit.com/r/Maromba/comments/1etmpyi/sugest%C3%A3o_de_aplicativo_gratuito_para/](https://www.reddit.com/r/Maromba/comments/1etmpyi/sugest%C3%A3o_de_aplicativo_gratuito_para/)
* [https://www.hipertrofia.org/forum/topic/266748-como-voc%C3%AAs-organizam-fichas-programas-de-treinamento](https://www.hipertrofia.org/forum/topic/266748-como-voc%C3%AAs-organizam-fichas-programas-de-treinamento)
* [https://www.reddit.com/r/Maromba/comments/xr7wgm/apps_de_organiza%C3%A7%C3%A3o_de_treino/](https://www.reddit.com/r/Maromba/comments/xr7wgm/apps_de_organiza%C3%A7%C3%A3o_de_treino/)
* [https://www.reddit.com/r/Maromba/comments/17s7q0p/vale_a_pena_usar_app_de_treino_na_academia/](https://www.reddit.com/r/Maromba/comments/17s7q0p/vale_a_pena_usar_app_de_treino_na_academia/)

## 1.5 Visão Geral do Documento

Organizado em introdução, descrição geral, requisitos funcionais e não funcionais, diagramas, considerações finais e métodos e técnicas.

---

# 2. Descrição Geral

## 2.1 Perspectiva do Produto

O TT será um aplicativo e site que poderá ser usado offline, sem necessidade de login. Ele terá foco em simplicidade e praticidade, permitindo:

* Organização dos treinos em blocos (aquecimento, principal, acessórios, etc.).
* Importação e exportação de treinos.
* Configuração rápida de treinos pré-prontos e personalizados.
* Ajuste automático de carga do treino (tempo ou repetições).
* Registro do histórico e acompanhamento da evolução.

## 2.2 Funções do Produto

* Criar e editar treinos personalizados (CRUD completo).
* Exibir treinos pré-prontos com base no questionário inicial.
* Mostrar informações essenciais: exercício, séries, repetições/tempo, descanso.
* Oferecer recursos de execução: cronômetro, sons de aviso, pausar/pular/retroceder exercício.
* Permitir visualização do próximo exercício no descanso.
* Registrar histórico de treinos executados por data.
* Definir e acompanhar metas de progresso.
* Exibir notificações internas quando metas forem atingidas.

## 2.3 Características dos Usuários

* **Iniciantes:** procuram treinos prontos, interface simples, instruções visuais e sonoras.
* **Intermediários:** querem personalizar blocos, séries e cargas; valorizam histórico e metas.
* **Avançados:** focam em evolução detalhada e importação/exportação de treinos; buscam autonomia e flexibilidade.

## 2.4 Restrições

* O aplicativo deve funcionar em dispositivos Android de entrada, com baixo consumo de memória.
* Não deve depender de conexão à internet para uso básico.
* Não deve exibir anúncios que prejudiquem ou interrompam a execução do treino.
* A interface deve ser limpa e com baixo tempo de resposta.

## 2.5 Suposições e Dependências

* Usuários terão acesso a dispositivos móveis com recursos básicos de áudio.
* Atualizações futuras poderão incluir sincronização em nuvem, desde que opcionais.

---

# 3. Requisitos Específicos

## 3.1 Requisitos Funcionais

* **RF01** – O sistema deve criar treinos pré-prontos e personalizados para o usuário, com base nas respostas a um questionário inicial.
* **RF02** – O sistema deve disponibilizar treinos separados em blocos, e dentro dos blocos em séries.
* **RF03** – O sistema deve permitir a organização dos treinos em pastas, de acordo com o objetivo do usuário.
* **RF04** – O sistema deve possibilitar importar e exportar treinos.
* **RF05** – O sistema deve permitir CRUD de treinos personalizados.
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

## 3.2 Requisitos Não Funcionais

* **RNF01** – O sistema deve possuir navegação simples e intuitiva.
* **RNF02** – O sistema deve ser leve e rápido, adequado para dispositivos de entrada.
* **RNF03** – O sistema deve apresentar interface limpa, com elementos de fácil percepção.
* **RNF04** – O sistema não deve exibir anúncios intrusivos; caso existam, não podem atrapalhar ou limitar o uso.
* **RNF05** – O sistema deve funcionar sem necessidade de login ou acesso à internet.

## 3.3 Regras de Negócio

* **RB01** – O questionário inicial deve determinar quais treinos pré-prontos serão sugeridos ao usuário.
* **RB02** – A alteração da carga geral do treino deve ajustar automaticamente todos os exercícios vinculados, aumentando ou diminuindo repetições (+/-1) ou tempo (+/-60s).
* **RB03** – As metas definidas devem ser acompanhadas individualmente por treino ou exercício.
* **RB04** – As notificações de metas atingidas devem ocorrer apenas dentro do aplicativo (sem push externo).
---
# 4. Modelos e Diagramas de Apoio
## 4.1 Diagrama de Casos de Uso: 
<img width="1077" height="1308" alt="use-case" src="https://github.com/user-attachments/assets/539d785f-bd11-4e4e-b68f-95210ef112f9" />

## 4.2 Diagramas de Classes ou Entidades: 

<img width="655" height="655" alt="class-diagrama" src="https://github.com/user-attachments/assets/dd8adc10-697d-4062-bd1c-d66897b1e646" />

---

# 5. Considerações Finais

## 5.1 Prioridade dos Requisitos

* **M (Must Have):** RF01, RF02, RF05, RF06, RF07, RF08, RF09, RF10, RNF01, RNF03, RNF05, RNF02, RB01.
* **S (Should Have):** RF13, RF14, RF15, RB03.
* **C (Could Have):** RF03, RF04, RF11, RF12, RNF04, RB02, RB04.
* **W (Won't Have):** Nenhum nesta versão.

## 5.2 Apêndices

### Glossário

* **TT (Training Timer):** Um aplicativo mobile para gestão e acompanhamento de treinos físicos personalizados, com foco em simplicidade, praticidade e uso offline.
* **Treinos em Blocos e Séries:** Metodologia de treino que organiza exercícios em seções (blocos) e repetições (séries), oferecendo flexibilidade para se adaptar a diferentes cenários e objetivos.

### Exemplos de Treino

**Exemplo de Treino por Repetição (Musculação):**

* **Bloco Principal:** Peito e Tríceps

  * Supino Reto (4 séries de 10 repetições)
  * Crossover (3 séries de 12 repetições)
  * Tríceps Corda (3 séries de 15 repetições)

**Exemplo de Treino por Tempo (HIIT/Aeróbico):**

* **Bloco Principal:** Cardio de Alta Intensidade

  * Corrida no lugar (30 segundos)
  * Agachamento com salto (30 segundos)
  * Burpees (30 segundos)

---

# 6. Métodos e Técnicas

### Entrevista

O processo seguiu as seguintes etapas:

**Preparação:** a equipe definiu o público-alvo e elaborou um roteiro para garantir que todas as áreas relevantes fossem exploradas.

**Condução:** entrevistas individuais incentivando relatos sobre rotinas, desafios e expectativas.

**Documentação:** registro dos pontos-chave e insights relevantes.

**Algumas perguntas feitas:**

1. *Como você controla e distribui fichas para diferentes alunos?*
   “Como eles (a academia) usam app, cada aluno baixa em seu próprio aparelho de telefone o aplicativo, eu só configuro as atividades que por ele (aluno) será feita de acordo com as necessidades do aluno.”

2. *Que tipo de informações são mais importantes em uma ficha de treino?*
   “Os exercícios a serem realizados no dia (ex: treino A, treino B ou treino C) a carga e as repetições, o tempo de descanso é o mesmo para todos, 30 segundos.”

---

### Observação

O método de observação permitiu identificar necessidades reais no ambiente da academia:

* Como as pessoas interagem com treinos e equipamentos.
* Por que uma interface simples e offline é essencial.

---

### Estudo de Documentação

Incluiu:

* Análise de aplicativos concorrentes.
* Consulta a artigos, fóruns e blogs.
* Identificação de expectativas e dores dos usuários.

Esse estudo foi fundamental para definir o escopo do TT.

---

### Prototipação

**Protótipo Visual:** primeiros fluxos e telas.
**Protótipo Funcional:** CRUD de treinos e execução básica.
**MVP:** construção das funcionalidades mínimas para entrega de valor ao usuário.

---


