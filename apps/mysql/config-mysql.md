# MySQL Configurations

## MySQL Server
1. Instalar o servidor, caso ainda não esteja instalado:
    ```sh
    sudo apt-get install mysql-server -y
    ``` 
2. Iniciar o wizard de configuração do acesso ao servidor:
    ```sh
    sudo mysql_secure_installation
    ```
    Seguir as instruções de configurações.
3. Alterar o endereço local:
    ```sh
    sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
    ```
    Localizar o termo `bind-address`, substituir o IP para `0.0.0.0` e salvar o arquivo.
4. Reiniciar o serviço 
    ```sh
    sudo systemctl restart mysql
    ```
5. Caso queira ativar como serviço
    ```sh 
    sudo systemctl enable mysql
    ```
6. Verificar o serviço ativo na porta 3306
    ```sh
    ss -ltn
    ```
7. Adicionar o serviço a exceção do firewall padrão do Ubuntu
    ```sh
    sudo ufw allow from any to any port 3306 proto tcp
    ```

## Configurar usuário

Acessar o MySQL:
```sh
sudo mysql
```

Criar e configurar novo usuário:
```SQL
DROP USER 'felipe'@'localhost';
FLUSH PRIVILEGES;
CREATE USER 'felipe'@'localhost' IDENTIFIED BY 'Felipe@123456';
GRANT ALL PRIVILEGES ON * . * TO 'felipe'@'localhost';
ALTER USER 'felipe'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Felipe@123456';
```

## Root User
```sh
sudo mysql -u root -p
```

`[sudo] password for felipe:` *senha root da máquina*

`Enter password:` *senha padrão do mysql (" ")*

```sh
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
```

## MySQL Workbanch

Configurar ambiente do Workbench
```sh
snap connect mysql-workbench-community:password-manager-service
snap connect mysql-workbench-community:ssh-keys
```

Fontes: 
- https://linuxconfig.org/install-mysql-on-ubuntu-20-04-lts-linux
- https://snapcraft.io/mysql-workbench-community
- https://dev.mysql.com/doc/refman/8.0/en/default-privileges.html
- https://stackoverflow.com/questions/50387952/how-to-resolve-unable-to-load-authentication-plugin-caching-sha2-password-issu