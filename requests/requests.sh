# REGISTRO ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Criar um usuario generico localmente
curl --request POST \--url http://localhost:3000/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteLocal","password":"senhateste01","email":"usertesteLocal@example.com"}'

# Criar um usuario generico no deploy do vercel
curl --request POST \--url https://backend-mongo-crud-a1qv.vercel.app/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteVercel","password":"senhateste01","email":"usertesteVercel@example.com"}'

# (ERRO) Testar registrar um usuario com email ja existente
curl --request POST \--url https://backend-mongo-crud-a1qv.vercel.app/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertestemail02","password":"senhateste01","email":"usertesterepetido@example.com"}'

# (ERRO) Testar registrar uma senha invalida (menos de 6 caracteres)
curl --request POST \--url https://backend-mongo-crud-a1qv.vercel.app/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteSenhaCurta","password":"s","email":"usertestesenha@example.com"}'

# (ERRO) Testar registrar um email invalido (sem @)
curl --request POST \--url https://backend-mongo-crud-a1qv.vercel.app/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteemailinvalido","password":"senhateste01","email":"userteste02example.com"}'

# (ERRO) Requisição mal formatada (sem email)
curl --request POST \--url http://localhost:3000/users/register \--header 'Content-Type: application/json' \--data '{"username":"usertesteInvalido","password":"senhateste01"}'

# LOGIN ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Login com usuario generico
curl --request POST \--url https://backend-mongo-crud.vercel.app/users/login \--header 'Content-Type: application/json' \--data '{"username":"userTesteLogin","password":"senhatesteLogin"}'

# (ERRO) Login com usuario invalido
curl --request POST \--url https://backend-mongo-crud.vercel.app/users/login \--header 'Content-Type: application/json' \--data '{"username":"userInvalid","password":"senhateste"}'

# (ERRO) Login com senha invalida -- TINHA ESQUECIDO DE COLOCAR /USERS/LOGIN NO FIM DA URL
curl --request POST \--url https://backend-mongo-crud-a1qv.vercel.app/users/login \--header 'Content-Type: application/json' \--data '{"username":"userTesteLogin","password":"senhainvalida"}'

# (ERRO) Login com requisição mal formatada (sem senha)
curl --request POST \--url https://backend-mongo-crud-a1qv.vercel.app/users/login \--header 'Content-Type: application/json' \--data '{"username":"userTesteLogin"}'

# Acessando rota protegida -- CORRIGINDO TOKEN
curl --request GET \--url https://backend-mongo-crud.vercel.app/protected \--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MTI2ZTFlNWVlZjc3YzFhZTk3MDNhNyIsImlhdCI6MTc0NjA0MDk3NiwiZXhwIjoxNzQ2MDQ0NTc2fQ.aDXWrZsyvGZntHgS7TRM1f68StV1eqPm6Z6bsxTc8yc'

# (ERRO) Acessando rota protegida sem token
curl --request GET \--url https://backend-mongo-crud-a1qv.vercel.app/protected \--header 'Content-Type: application/json'