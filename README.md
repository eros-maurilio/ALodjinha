# ALodjinha
## AmeDigital iOS challange
<!--ts-->
   * [Sobre](#sobre)
   * [Requisitos Básicos do Desafio](#requisitos-básicos-do-desafio)
      * [Home](#home)
      * [Listagem da Categoria](#listagem-da-categoria)
      * [Exibição de Produto](#exibição-de-produto)
   * [Instalação](#instalacao)
   * [Como usar](#como-usar)
      * [Pre Requisitos](#pre-requisitos)
      * [Local files](#local-files)
      * [Remote files](#remote-files)
      * [Multiple files](#multiple-files)
      * [Combo](#combo)
   * [Tests](#testes)
   * [Tecnologias](#tecnologias)
<!--te-->
###
## Sobre
An iOS development challenge created by the company [AmeDigital](https://github.com/AmeDigital). The challenge can be found at: [aLodjinha](https://github.com/AmeDigital/challenge-ios).

## Requisitos Básicos do Desafio
- [x] Versão mínima: iOS 9.0
- [x] Swift

### Home
### Premissa
- [x] A tela de Home deve ser acessada ao tocar a opção Home do Tab Bar, conforme protótipo.
- [x] O tamanho total da tela de Home deve ser determinada pelo tamanho total de todos as views somadas; ou seja, não deverá haver sub-scroll vertical.
- [x] Ao exibir qualquer Funcionalidade externa acessada pela Home, a Tab Bar não deve aparecer.

### Funcionalidade 01
- [x] Exibir a barra de banners rotativo.
- [x] Cada banner deve preencher todo o espaço horizontal da tela.
- [x] Ao realizar o swipe left ou swipe right, o banner deve ser trocado pelo próximo ou anterior, conforme disponibilidade.
- [x] Utilizar um indicador para facilitar ao usuário saber quantos banners existem e em qual posição ele está.

### Funcionalidade 02
- [x] Exibir um menu deslizável horizotal com as categorias.
- [x] Ao clicar em uma categoria, o app deve redirecionar o usuário para a Funcionalidade 04.

### Funcionalidade 03
- [x] Exibir uma lista dos produtos mais vendidos.
- [x] O usuário deve ser direcionado à Funcionalidade 05.

### Screenshot da Home
<img src="https://user-images.githubusercontent.com/86015861/156811990-e3588084-fc3f-49d1-abf5-b29a1258044a.jpeg" width=30% height=30%>

### Listagem da Categoria
### Premissa
- [x] A Tab Bar não deve ser exibida.
- [x] Ao voltar para Home, a Tab Bar deve voltar a ser exibida.
- [x] Um indicador de loading deve ser exibido enquanto uma nova página estiver sendo carregada.
- [x] O usuário não deve ficar com a rolagem e navegação travados enquanto uma nova página estiver sendo carregada.

### Funcionalidade 04
- [x] Exibir uma lista dos produtos da categoria selecionada.
- [ ] A lista possui um número desconhecido de produtos, e deverá ser paginado, limitando a página em 20 registros. _(Não há limite de paginação pela API)_
- [x] Ao tocar em um produto, o usuário deverá ser direcionado à Funcionalidade 05.

### Screenshot da Listagem da Categoria
<img src="https://user-images.githubusercontent.com/86015861/156819539-13a6928e-d7b8-4fb1-8b2b-b004ff2bbabf.jpeg" width=30% height=30%>

### Exibição de Produto
### Premissa
- [x] A Tab Bar não deve ser exibida.
- [x] Se exibida a partir da Home, ao voltar, a Tab Bar deve ser exibida novamente.

### Funcionalidade 05
- [x] Exibir a descrição do produto conforme protótipo.
- [x] O botão Reservar deve estar sempre visível, fixado na parte de baixo da tela.
- [x] O app deve tratar em HTML e exibí-lo corretamente (negrito, itálico, etc).
