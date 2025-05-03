# REGISTRO ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Criar um usuario generico localmente
curl --request POST \--url http://localhost:5000/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteRegistro","password":"senhateste01","email":"usertesteLocal@example.com"}'

# (ERRO) Testar registrar um usuario com email ja existente
curl --request POST \--url http://localhost:5000/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertestemail02","password":"senhateste01","email":"usertesterepetido@example.com"}'

# (ERRO) Testar registrar uma senha invalida (menos de 6 caracteres)
curl --request POST \--url http://localhost:5000/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteSenhaCurta","password":"s","email":"usertestesenha@example.com"}'

# (ERRO) Testar registrar um email invalido (sem @)
curl --request POST \--url http://localhost:5000/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteemailinvalido","password":"senhateste01","email":"userteste02example.com"}'

# (ERRO) Requisição mal formatada (sem email)
curl --request POST \--url http://localhost:5000/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteInvalido","password":"senhateste01"}'

# LOGIN ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Login com usuario generico
curl --request POST \--url http://localhost:5000/users/login \--header 'Content-Type: application/json' \--data '{"username":"usertesteLogin","password":"senhateste01"}'

# (ERRO) Login com usuario invalido
curl --request POST \--url http://localhost:5000/users/login \--header 'Content-Type: application/json' \--data '{"username":"userInvalid","password":"senhateste"}'

# (ERRO) Login com senha invalida
curl --request POST \--url http://localhost:5000/users/login \--header 'Content-Type: application/json' \--data '{"username":"usertesteLogin","password":"senhainvalida"}'

# (ERRO) Login com requisição mal formatada (sem senha)
curl --request POST \--url http://localhost:5000/users/login \--header 'Content-Type: application/json' \--data '{"username":"usertesteLogin"}'

# Acessando rota protegida 
curl --request GET \--url http://localhost:5000/protected \--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzQ2MzA4ODM5LCJleHAiOjE3NDYzOTUyMzl9.lEleCy_COOYV9W56YawrAkhh52M3wTN8C5evIWRvcgs'

# (ERRO) Acessando rota protegida sem token
curl --request GET \--url http://localhost:5000/protected \--header 'Content-Type: application/json'