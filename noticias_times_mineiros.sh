#!/usr/bin/env bash
#
# noticias_times_mineiros.sh - Programa para saber as principais noticias dos times mineiros;
#
# Site:       http://luizguilherme.tech
# Autor:      Luiz Guilherme
# Manutenção: Luiz Guilherme
#
# ------------------------------------------------------------------------ #
#  O que este programa está fazendo xxxx
#
#  Exemplos:
#      $ ./noticias_times_mineiros.sh
#      Neste exemplo o programa será executado e cairá no menu ao qual irá pedir para que o usuário escolha sobre qual time quer se informar;
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 31/01/2021, Luiz :
#       - Início do programa
#   
# ------------------------------------------------------------------------ #
# Testado em:
#  zsh 5.8

# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
VERMELHO="\033[31;1m"
SEM_COR="\033[37;1m"
AZUL="\033[34;1m"
VERDE="\033[32;1m"

ARQUIVO_NOTICIAS="noticias.txt"
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# Foi criada funções para cada time.
Atletico () {

  lynx -source https://www.itatiaia.com.br/futebol/atletico | grep title-medium | sed 's/<h3.*">//' | sed 's/<\/.*//' > noticias.txt

  echo -e "${SEM_COR}NOTICIAS ESPORTIVAS DO CLUBE ATLÉTICO MINEIRO
  ${SEM_COR}fonte:${VERMELHO} RÁDIO ITATIAIA

  (Para ler alguma das noticias completa acesse: https://www.itatiaia.com.br/futebol/atletico )\n"

  while read -r noticia
  do

  echo -e "  ${VERMELHO}Titulo: ${SEM_COR}$noticia"
  done < "$ARQUIVO_NOTICIAS"

}

Cruzeiro () {

  lynx -source https://www.itatiaia.com.br/futebol/cruzeiro | grep title-medium | sed 's/<h3.*">//' | sed 's/<\/.*//' > noticias.txt

  echo -e "${SEM_COR}NOTICIAS ESPORTIVAS DO CRUZEIRO ESPORTE CLUBE
  ${SEM_COR}fonte:${VERMELHO} RÁDIO ITATIAIA

  (Para ler alguma das noticias completa acesse: https://www.itatiaia.com.br/futebol/cruzeiro )\n"

  while read -r noticia
  do

  echo -e "  ${VERMELHO}Titulo: ${SEM_COR}$noticia"
  done < "$ARQUIVO_NOTICIAS"

}

America () {

  lynx -source https://www.itatiaia.com.br/futebol/america | grep title-medium | sed 's/<h3.*">//' | sed 's/<\/.*//' > noticias.txt

  echo -e "${SEM_COR}NOTICIAS ESPORTIVAS DO AMÉRICA MINEIRO
  ${SEM_COR}fonte:${VERMELHO} RÁDIO ITATIAIA

  (Para ler alguma das noticias completa acesse: https://www.itatiaia.com.br/futebol/america ) \n"

  while read -r noticia
  do

  echo -e "  ${VERMELHO}Titulo: ${SEM_COR}$noticia"
  done < "$ARQUIVO_NOTICIAS"

}

# ------------------------------- EXECUÇÃO ----------------------------------------- #
# Pelo menu, você escolhe o time ao qual você deseja ver as noticias.

echo -e "${SEM_COR}'\n'"
    echo -e  "${VERDE}================================================================"
    echo -e  "${SEM_COR}     Noticias Esportivas e Atualizadas dos times Mineiros   "
    echo -e  "${VERDE}================================================================"
    echo -e  "${VERDE}       ==================================================      "
    echo -e  "${VERDE}          ============================================          "
    echo -e  "${VERDE}            ========================================            "
    echo -e  "${VERDE}__________________________"
    echo -e "${SEM_COR} [ 1 ] | ATLÉTICO MINEIRO"
    echo -e "${AZUL} [ 2 ] | CRUZEIRO"
    echo -e "${VERDE} [ 3 ] | AMÉRICA MINEIRO"
    echo -e "${VERMELHO} [ 4 ] | SAIR"

echo -e "${SEM_COR}Digite o número respectivo á qual time você quer se informar no momento:"

read opcao

# No case, de acordo com o time selecionado ele vai direcionar para a função do time respectivo, e um tratamento de erro para números inválidos.
case $opcao in

  1) Atletico ;;
  2) Cruzeiro ;;
  3) America ;;
  4) exit 0 ;;
  *) echo "Opção inválida." && exit 1 ;;

esac

exit 0
# ------------------------------------------------------------------------ #
