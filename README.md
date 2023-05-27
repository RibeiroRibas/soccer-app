# Sorteia meu time! - app


# 1. Sobre o App

Aplicativo em flutter para Android e IOS em desenvolvimento . A idéia surgiu a partir de uma dificuldade que eu e muitos peladeiros temos para decidir quem vai escolher os times e, quando decide, o time fica totalmente desequilibrado. Outro impecílio que também perambula pelos gramados é a substituição dos jogadores, normalmente feito por tempo ou por gol sofrido, nesse app você vai poder configurar a partida para facilitar as substituições.

## Objetivo

O aplicativo tem como objetivo principal para sua primeira versão sortear de forma equilibrada, por posição, por overall e aleatória times de futebol na modalidades society ou futsal.

## Funcionalidades :hammer:

1. Sortear time de forma equilibrada.
2. Sortear times de forma Aleatória.
3. Sortear times por posição.
4. Sortear times por overall do jogador.
5. Cadastrar jogadores.
6. Cadastrar partida.
7. Interagir com a partida em andamento.
8. Salvar automaticamente os times sorteados após a partida.
9. Salvar automaticamente as partidas disputadas.
10. Mostrar histórico dde jogos.
11. Cadastrar configurações da partida.

## Características :scroll:

1. Dar suporte apenas para o modo retrado.
2. Funciona offline.
3. SO Android e IOS.
4. Dar suporte pra temas e cores diferentes.
  
# 2. Documentação

## Arquitetura

O projeto usa como modelo de arquitetura o padrão MVVM (model-view-viewmodel).
![mvvm](https://github.com/RibeiroRibas/soccer-app/assets/96504657/e64ce710-8d7f-4029-b2e2-dca5e13cd41e)

- `model:` É o modelo de domínio ou o modelo que representa os dados do backend. Modelos guardam informação mas não lidam com comportamento. Eles não formatam os dados e nem influenciam como eles serão apresentados.
- `view:` Essa é única parte da aplicação que o usuário interage diretamente. Todos os componentes visuais ficam nessa camada. Todos os eventos que aqui acontecem são enviados diretamente para o view model. A View não tem a responsabilidade de processar dados e muito menos lidar com estados.
- `viewmodel:` Camada que age como um intermediário entre a view e o model, processa os eventos antes de apresentar para a view. Também pode fornecer métodos para lidar com os estados da view. 

## Organizaçao dos pacotes

- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/3eb5d8b4-c9ae-444d-bc30-339c3161e579) - toda e qualquer imagem adicionada ao projeto.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/ec511c38-d16f-4dd6-a943-7acab965fe9f) - toda e qualquer font de texto adicionada ao projeto.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/49cb90ff-355c-44f4-9bb9-0694a7283992) - classes modelo do projeto, as que tem relação direta com o mundo real.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/a7459e64-c67c-404c-b225-a49a0ae207ca) - camada para persistência de dados.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/bbf7d2e7-a7a3-4ab3-b91f-ef4c45457d11) - camada compartilhada, toda e qualquer informação compartilhado no app, como classes e métodos úteis, mensagens de texto, themas, cores,etc.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/aed81b9e-2900-4a54-b37c-d290bce1c058) - camada visual (view e viewmodel), camada de IU, interface do usuário e gerenciamento de estados.

## Nomenclaturas

- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/b2042828-5b36-4985-ae9f-bac82e7b1cef) - arquivos com o final `component` -> componentes visuais reaproveitáveis, como um botão por exemplo.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/d2e1fcb3-9541-45ad-83d9-7f41859efad0) - arquivos com o final `layout` -> estrutura base para compor um modelo de página.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/e55ac267-a3d3-4f90-9622-d52404502f2e) - arquivos com o final `section` -> agrupamento de componentes visuais formando uma seção com o intuito de ser reaproveitada.
- ![](https://github.com/RibeiroRibas/soccer-app/assets/96504657/c0f4be53-0794-4cac-b5c8-6a378ad3ddde) - arquivos com o final `view` -> representa as telas da aplicação.
