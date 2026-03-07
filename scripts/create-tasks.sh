#!/bin/bash
# Script para criar tasks como sub-issues dos User Stories no GitHub
# Pré-requisito: GitHub CLI (gh) instalado e autenticado
# Uso: bash create-tasks.sh

REPO="Tart-development/training-timer-documentation"

create_task() {
  local parent_issue=$1
  local title=$2
  local body=$3
  echo "Criando: $title (parent: #$parent_issue)"
  ISSUE_URL=$(gh issue create --repo "$REPO" --title "$title" --body "$body" --label "Task")
  ISSUE_NUMBER=$(echo "$ISSUE_URL" | grep -oE '[0-9]+$')
  if [ -n "$ISSUE_NUMBER" ]; then
    gh api --method POST \
      -H "Accept: application/vnd.github+json" \
      "/repos/$REPO/issues/$parent_issue/sub_issues" \
      -f sub_issue_id="$ISSUE_NUMBER" 2>/dev/null || true
    echo "  Criada issue #$ISSUE_NUMBER e vinculada ao #$parent_issue"
  fi
}

echo "=== EPIC-02: Uso offline, Login e Sincronizacao ==="

# US-02.1 (#20)
create_task 20 "[TASK-02.1.1]: Tela de execucao com suporte offline" "Adaptar a interface da tela de execucao de treino para funcionar sem conexao com a internet.

## Checklist Tecnico:
- [ ] Exibir banner/icone de status de conexao na tela de execucao
- [ ] Desabilitar acoes que dependem de rede quando offline
- [ ] Garantir que a tela carrega e funciona sem internet

### Criterios de Aceite
- A tela de execucao funciona completamente offline e exibe o status de conexao ao usuario."

create_task 20 "[TASK-02.1.2]: Camada de persistencia local de treinos" "Implementar banco de dados local para armazenar series, repeticoes e cargas durante execucao offline.

## Checklist Tecnico:
- [ ] Configurar banco local (SQLite ou AsyncStorage)
- [ ] Mapear entidades: treino, serie, repeticao
- [ ] Gravar cada interacao do usuario no banco local em tempo real
- [ ] Implementar trigger de sincronizacao ao reconectar com a internet

### Criterios de Aceite
- Dados de treino sao salvos localmente e sincronizados com Supabase ao reconectar sem perda ou duplicidade."

create_task 20 "[TASK-02.1.3]: Prototipo do indicador de status de conexao" "Prototipar o componente visual que indica ao usuario se o app esta online ou offline durante o treino.

## Checklist Tecnico:
- [ ] Criar design do icone/banner para os estados online e offline
- [ ] Definir cores e legendas para cada estado
- [ ] Validar prototipo no fluxo da tela de execucao

### Criterios de Aceite
- Prototipo aprovado com indicacao visual clara do estado de conexao em qualquer tela de treino."

# US-02.2 (#21)
create_task 21 "[TASK-02.2.1]: Implementar fluxo de acesso sem login (modo convidado)" "Criar o fluxo de navegacao que permite ao usuario acessar e executar treinos sem criar uma conta.

## Checklist Tecnico:
- [ ] Criar rota Continuar sem login na tela inicial
- [ ] Garantir acesso as telas de treino sem autenticacao
- [ ] Persistir dados do convidado no banco local do dispositivo
- [ ] Exibir convite de criacao de conta apos finalizar primeiro treino

### Criterios de Aceite
- Usuario acessa e executa treinos sem criar conta. Dados sao salvos localmente."

create_task 21 "[TASK-02.2.2]: Migracao de dados do convidado para conta autenticada" "Implementar logica para vincular os dados salvos em modo convidado ao perfil do usuario apos criar conta ou fazer login.

## Checklist Tecnico:
- [ ] Detectar dados locais de sessao de convidado no momento do login
- [ ] Migrar treinos e historico do convidado para a conta criada no Supabase
- [ ] Garantir ausencia de duplicidade apos migracao

### Criterios de Aceite
- Treinos feitos como convidado aparecem corretamente na conta apos login ou criacao de conta."

create_task 21 "[TASK-02.2.3]: Prototipo do fluxo de onboarding sem login" "Prototipar as telas do onboarding com a opcao de acesso sem login e o momento de convite para criacao de conta.

## Checklist Tecnico:
- [ ] Criar wireframe da tela de boas-vindas com opcao Continuar sem login
- [ ] Prototipar modal de convite para criacao de conta pos-primeiro treino
- [ ] Validar fluxo completo com stakeholders

### Criterios de Aceite
- Fluxo de onboarding sem login aprovado e alinhado com a identidade visual do app."

# US-02.3 (#22)
create_task 22 "[TASK-02.3.1]: Sincronizacao automatica local para Supabase pos-login" "Desenvolver a logica de upload dos dados locais pendentes para o Supabase apos autenticacao bem-sucedida.

## Checklist Tecnico:
- [ ] Verificar existencia de dados locais nao sincronizados no momento do login
- [ ] Realizar upload automatico dos dados para o Supabase
- [ ] Garantir consistencia e ausencia de duplicidade
- [ ] Retomar sincronizacao caso a internet caia durante o processo

### Criterios de Aceite
- Dados locais sao enviados ao Supabase após login sem perda, duplicidade ou travamento da UI."

create_task 22 "[TASK-02.3.2]: Feedback visual do status de sincronizacao" "Implementar indicadores visuais que informam ao usuario o estado atual da sincronizacao com a nuvem.

## Checklist Tecnico:
- [ ] Exibir indicador Sincronizando... durante o processo
- [ ] Exibir confirmacao Dados sincronizados ao finalizar
- [ ] Exibir mensagem de erro caso a sincronizacao falhe

### Criterios de Aceite
- Usuario recebe feedback claro e discreto sobre o estado da sincronizacao em todo momento."

# US-02.4 (#23)
create_task 23 "[TASK-02.4.1]: Restauracao de dados ao logar em novo dispositivo" "Implementar logica de pull do Supabase para restaurar treinos, historico e preferencias em um dispositivo novo ou reinstalado.

## Checklist Tecnico:
- [ ] Buscar dados do perfil do usuario no Supabase apos login em dispositivo novo
- [ ] Popular banco local do novo dispositivo com os dados remotos
- [ ] Garantir integridade e ausencia de conflitos entre dados locais e remotos

### Criterios de Aceite
- Ao logar em novo dispositivo, todos os dados do usuario sao restaurados sem reconfiguracao manual."

create_task 23 "[TASK-02.4.2]: Prototipo do fluxo de restauracao de dados" "Prototipar os estados visuais do processo de restauracao de dados em um novo dispositivo.

## Checklist Tecnico:
- [ ] Criar tela/loading Restaurando seus dados...
- [ ] Prototipar tela de confirmacao de restauracao concluida
- [ ] Validar fluxo com stakeholders

### Criterios de Aceite
- Fluxo de restauracao aprovado com UX clara e alinhada a identidade visual do app."

# US-02.5 (#24)
create_task 24 "[TASK-02.5.1]: Persistencia imediata de progresso de treino" "Implementar mecanismo de checkpoint que grava cada interacao do usuario imediatamente no banco local durante o treino.

## Checklist Tecnico:
- [ ] Gravar no banco local a cada serie marcada ou valor alterado
- [ ] Implementar deteccao de treino inacabado ao reabrir o app
- [ ] Restaurar estado da tela exatamente de onde o usuario parou

### Criterios de Aceite
- Nenhum dado de treino e perdido em caso de fechamento inesperado. O app retoma do ponto correto."

create_task 24 "[TASK-02.5.2]: Prototipo do fluxo de retomada de treino interrompido" "Prototipar o modal que aparece ao usuario quando um treino inacabado e detectado ao reabrir o app.

## Checklist Tecnico:
- [ ] Criar modal Retomar treino em andamento?
- [ ] Prototipar opcoes de retomar ou descartar o treino
- [ ] Validar fluxo com stakeholders

### Criterios de Aceite
- Modal de retomada aprovado com UX clara para o usuario decidir retomar ou descartar."

echo ""
echo "=== EPIC-03: Gestao inteligente e personalizacao de treinos ==="

# US-03.1 (#26)
create_task 26 "[TASK-03.1.1]: Tela de criacao e edicao de treinos" "Implementar as telas de criacao e edicao de treinos personalizados.

## Checklist Tecnico:
- [ ] Criar tela de novo treino com campo de nome
- [ ] Implementar adicao e remocao de exercicios
- [ ] Permitir edicao de ordem, carga e repeticoes
- [ ] Salvar treino no banco local/Supabase

### Criterios de Aceite
- Usuario cria, edita e salva treinos personalizados. Treino aparece imediatamente na lista."

create_task 26 "[TASK-03.1.2]: Exclusao de treino com confirmacao" "Implementar o fluxo de exclusao de treino com modal de confirmacao antes de deletar permanentemente.

## Checklist Tecnico:
- [ ] Adicionar opcao de exclusao na listagem/detalhe de treino
- [ ] Exibir modal de confirmacao antes de deletar
- [ ] Remover treino do banco local e do Supabase

### Criterios de Aceite
- Treino e excluido apenas apos confirmacao do usuario. Exclusao reflete imediatamente na lista."

create_task 26 "[TASK-03.1.3]: Prototipo das telas de CRUD de treinos" "Prototipar todas as telas do fluxo de criacao, edicao, listagem e exclusao de treinos personalizados.

## Checklist Tecnico:
- [ ] Wireframe da tela de listagem de treinos
- [ ] Wireframe da tela de criacao/edicao de treino
- [ ] Prototipar modal de confirmacao de exclusao
- [ ] Validar fluxo com stakeholders

### Criterios de Aceite
- Fluxo completo de CRUD de treinos prototipado e aprovado."

# US-03.2 (#27)
create_task 27 "[TASK-03.2.1]: Implementar criacao de blocos dentro de um treino" "Desenvolver a funcionalidade que permite ao usuario criar e nomear blocos de exercicios dentro de uma ficha de treino.

## Checklist Tecnico:
- [ ] Adicionar opcao de criar bloco/titulo dentro do treino
- [ ] Permitir mover exercicios para dentro e fora de blocos
- [ ] Exibir exercicios agrupados por bloco na tela de execucao

### Criterios de Aceite
- Usuario agrupa exercicios em blocos. Tela de execucao exibe divisao por bloco claramente."

create_task 27 "[TASK-03.2.2]: Prototipo da estrutura de blocos e sessoes" "Prototipar a interface de criacao e visualizacao de treinos estruturados em blocos.

## Checklist Tecnico:
- [ ] Wireframe da tela de edicao com blocos colapsaveis
- [ ] Prototipar reorganizacao de exercicios entre blocos
- [ ] Validar fluxo com stakeholders

### Criterios de Aceite
- Prototipo de estrutura em blocos aprovado e alinhado com a identidade visual."

# US-03.3 (#28)
create_task 28 "[TASK-03.3.1]: Implementar fluxo do questionario de sugestao de treino" "Desenvolver o fluxo de perguntas e respostas que gera uma sugestao de treino personalizado.

## Checklist Tecnico:
- [ ] Criar telas de perguntas (objetivo, nivel, disponibilidade)
- [ ] Implementar logica de recomendacao baseada nas respostas
- [ ] Exibir lista de treinos sugeridos ao final
- [ ] Permitir salvar treino sugerido na biblioteca do usuario

### Criterios de Aceite
- Apos responder todas as perguntas, usuario ve ao menos uma sugestao compativel com seu objetivo."

create_task 28 "[TASK-03.3.2]: Prototipo do questionario de sugestao de treino" "Prototipar o fluxo de telas do questionario e a tela de resultado com sugestoes de treino.

## Checklist Tecnico:
- [ ] Wireframe de cada tela de pergunta
- [ ] Prototipar tela de resultado com sugestoes
- [ ] Validar fluxo com stakeholders

### Criterios de Aceite
- Fluxo do questionario prototipado e aprovado."

# US-03.4 (#29)
create_task 29 "[TASK-03.4.1]: Implementar controles de pular, voltar e pausar na execucao" "Desenvolver os botoes e logica de controle de fluxo na tela de treino em andamento.

## Checklist Tecnico:
- [ ] Implementar botao Pular que marca exercicio como ignorado e avanca
- [ ] Implementar botao Voltar que retorna ao exercicio/serie anterior
- [ ] Implementar botao Pausar/Retomar que congela o cronometro

### Criterios de Aceite
- Os tres controles funcionam em tempo real sem erros de contagem ou estado."

create_task 29 "[TASK-03.4.2]: Prototipo da tela de execucao com controles" "Prototipar a tela de treino em andamento com os botoes de controle de execucao.

## Checklist Tecnico:
- [ ] Wireframe da tela de execucao com botoes pular/voltar/pausar
- [ ] Prototipar estados visuais de cada controle
- [ ] Validar posicionamento e usabilidade com stakeholders

### Criterios de Aceite
- Prototipo da tela de execucao com controles aprovado."

# US-03.5 (#30)
create_task 30 "[TASK-03.5.1]: Exibir midia do exercicio e card de proximo exercicio" "Implementar a exibicao de GIF/imagem do exercicio atual e o card de antecipacao do proximo exercicio durante o descanso.

## Checklist Tecnico:
- [ ] Exibir imagem/GIF do exercicio atual na tela de execucao
- [ ] Exibir card com nome e carga do proximo exercicio durante o descanso
- [ ] Manter midia visivel durante cronometro de exercicio por tempo

### Criterios de Aceite
- Midia do exercicio exibida automaticamente. Card do proximo exercicio visivel durante o descanso."

create_task 30 "[TASK-03.5.2]: Prototipo do suporte visual e antecipacao de carga" "Prototipar a disposicao visual da midia do exercicio e do card de antecipacao na tela de execucao.

## Checklist Tecnico:
- [ ] Wireframe com area de midia do exercicio
- [ ] Prototipar card de proximo exercicio durante descanso
- [ ] Validar com stakeholders

### Criterios de Aceite
- Layout de suporte visual aprovado e sem prejudicar a leitura das informacoes de serie."

# US-03.6 (#31)
create_task 31 "[TASK-03.6.1]: Implementar alertas sonoros e de vibracao nos eventos do treino" "Desenvolver o sistema de feedback sonoro e tatil para os eventos criticos durante a execucao do treino.

## Checklist Tecnico:
- [ ] Emitir som ao zerar cronometro de descanso
- [ ] Emitir bipes de contagem regressiva nos ultimos 3s de exercicio por tempo
- [ ] Acionar vibracao quando volume de midia estiver silenciado
- [ ] Interromper sons ao fechar o treino

### Criterios de Aceite
- Sons e vibracoes distintos para cada evento. Respeitam configuracao de volume do dispositivo."

# US-03.7 (#32)
create_task 32 "[TASK-03.7.1]: Implementar CRUD de pastas e categorias de treinos" "Desenvolver a funcionalidade de criacao, edicao e exclusao de pastas para organizar treinos.

## Checklist Tecnico:
- [ ] Criar tela de gerenciamento de pastas
- [ ] Permitir criar pasta com nome, cor e icone opcional
- [ ] Permitir mover treinos entre pastas
- [ ] Exibir modal de confirmacao ao excluir pasta com opcao de mover treinos para Sem Categoria

### Criterios de Aceite
- Usuario cria, edita e exclui pastas. Treinos sao movidos corretamente entre categorias."

create_task 32 "[TASK-03.7.2]: Prototipo da organizacao de treinos em pastas" "Prototipar a interface de listagem de treinos organizada em pastas/categorias.

## Checklist Tecnico:
- [ ] Wireframe da tela principal com treinos em pastas
- [ ] Prototipar fluxo de criar pasta e mover treino
- [ ] Validar com stakeholders

### Criterios de Aceite
- Prototipo de organizacao em pastas aprovado e alinhado com a identidade visual."

# US-03.8 (#33)
create_task 33 "[TASK-03.8.1]: Implementar exportacao de treino como link ou arquivo" "Desenvolver a funcionalidade de gerar um link ou arquivo com todos os dados de um treino para compartilhamento.

## Checklist Tecnico:
- [ ] Adicionar botao Compartilhar/Exportar na tela de detalhe do treino
- [ ] Gerar JSON ou link dinamico com estrutura completa do treino
- [ ] Validar geracao do arquivo/link

### Criterios de Aceite
- Usuario exporta treino como link ou arquivo contendo todos os blocos, exercicios e notas."

create_task 33 "[TASK-03.8.2]: Implementar importacao de treino via link ou arquivo" "Desenvolver a funcionalidade de importar um treino a partir de link ou arquivo gerado por outro usuario.

## Checklist Tecnico:
- [ ] Detectar abertura de link de treino no app
- [ ] Exibir pre-visualizacao read-only do treino a ser importado
- [ ] Validar existencia dos exercicios na base de dados global
- [ ] Salvar treino importado na biblioteca do usuario

### Criterios de Aceite
- Usuario visualiza e salva treino importado. Exercicios inexistentes sao criados ou substitutos sugeridos."

create_task 33 "[TASK-03.8.3]: Prototipo do fluxo de importacao e exportacao" "Prototipar as telas do fluxo de compartilhar, exportar e importar treinos.

## Checklist Tecnico:
- [ ] Wireframe da tela de exportacao/compartilhamento
- [ ] Prototipar tela de pre-visualizacao de treino importado
- [ ] Validar fluxo com stakeholders

### Criterios de Aceite
- Fluxo de importacao e exportacao prototipado e aprovado."

echo ""
echo "Todas as tasks criadas com sucesso!"