Nume: Trandafir Laura
Grupa: 341C3
Proiect Baze de date 2: Gestionarea unui cabinet veterinar

Setup:
1. Deschidere Sql, Docker Desktop
2. Pornire docker si rularea comenzii:
    sudo docker pull mcr.microsoft.com/mssql/server:2019-latest
3. Setup de parola si nume utilizator:
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=parolaAiaPuternic4!" -p 1433:1433 --name sql1 -h sql1 -d mcr.microsoft.com/mssql/server:2019-latest
4. Deschidere SQL Server si crearea unei noi date de baze si a unui query nou
5. Apasarea optiunii "COnnect Object Explorer"
6. Introducerea "127.0.0.1\{sql1},1433" la campul "server name"
7. Selectarea campului "SQL Server Authentification"
8. Autentificarea cu numele si parola introduse mai sus
9. Crearea tabelelor si Popularea bazei de date cu ajutorul SQL Server
10. Conectarea la PowerBI si mentionarea "127.0.0.1\{sql1},1433" la campul Server
12. Completarea fieldului Database cu numele bazei de date
11. Importarea procedurilor cu ajutorul comenzii "EXEC nume_procedura"
