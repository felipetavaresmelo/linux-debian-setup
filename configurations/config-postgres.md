# Postgres Configurations

## User default password

1. Criar a senha do usuário postgres do linux:
```sh
sudo passwd postgres
```

`[sudo] password for felipe:` *Senha root da máquina*
`New password:` *senha do usuário postgres*
`Retype new password:` *repetir a senha do usuário postgres*

>passwd: password updated successfully

2. Logar no terminal linux com o usuário postgres:
```sh
su postgres
```
`Password:`  *senha do usuário postgres*

3. Alterar a senha do usuário do banco:
```SQL
psql -c "ALTER USER postgres WITH PASSWORD 'postgres'" -d template1
```

Fonte:
- https://www.vivaolinux.com.br/dica/Alterando-senha-inicial-do-PostgreSQL-%5BUbuntu%5D