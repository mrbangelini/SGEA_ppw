# Sistema de Gestão de Eventos Acadêmicos (SGEA)

## Sobre
Sistema web em Django para gerenciar eventos acadêmicos, inscrições e certificados.

## Funcionalidades
- Autenticação e perfis de usuário
- Cadastro e edição de eventos
- Inscrição com controle de vagas
- Emissão e validação de certificados
- Gestão de instituições e locais

## Requisitos
Python 3.12, Django 5, SQLite

## Instalação
bash
cd django/sgea
python -m venv .venv
source .venv/bin/activate
.venv\Scripts\activate
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver


## Protótipo
Arquivos HTML em prototype/. Versão em PDF em docs/SGEA_prototipo_interface.pdf

## Autores
Pedro Klein, Marcelo Rabelo
