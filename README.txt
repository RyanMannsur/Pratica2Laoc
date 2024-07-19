GIT:

Ótimo! Para que seu amigo possa colaborar no projeto, você pode seguir estes passos:

### 1. Adicionar seu amigo como colaborador no GitHub

1. Vá para a página do repositório no GitHub.
2. Clique em **Settings** (Configurações).
3. No menu lateral, clique em **Collaborators** (Colaboradores).
4. Adicione o nome de usuário do GitHub do seu amigo e envie o convite.

Seu amigo receberá um e-mail com o convite para colaborar no repositório. Ele deve aceitar o convite para ter acesso ao projeto⁴.

### 2. Clonar o repositório

Seu amigo pode clonar o repositório para a máquina dele usando o comando `git clone`. Aqui estão os passos:

1. Abra o terminal ou prompt de comando.
2. Navegue até o diretório onde ele deseja clonar o repositório.
3. Execute o comando:
   git clone https://github.com/SEU_USUARIO/Pratica2Laoc.git
   Substitua `SEU_USUARIO` pelo seu nome de usuário no GitHub.

### 3. Desenvolver e colaborar

Aqui estão alguns comandos básicos que ele pode usar para desenvolver e colaborar no projeto:

- **Criar uma nova branch**:
  git checkout -b nome-da-branch

- **Adicionar mudanças**:
  git add .

- **Fazer commit das mudanças**:
  git commit -m "Mensagem do commit"

- **Enviar as mudanças para o GitHub**:
  git push origin nome-da-branch

- **Atualizar o repositório local com as mudanças do repositório remoto**:
  git pull origin main



Para juntar a branch do seu amigo na branch principal (`main`), você pode seguir estes passos:

1. **Certifique-se de estar na branch `main`**:
   git checkout main

2. **Atualize a branch `main` com as últimas mudanças do repositório remoto**:
   git pull origin main

3. **Faça o merge da branch do seu amigo na `main`**:
   git merge nome-da-branch-do-seu-amigo

4. **Resolva quaisquer conflitos que possam surgir**:
   - Se houver conflitos, o Git irá informá-lo. Você precisará editar os arquivos conflitantes para resolver os conflitos e depois fazer o commit das mudanças.

5. **Faça o commit das mudanças (se necessário)**:
   git commit -m "Resolvendo conflitos e mesclando a branch do amigo"

6. **Envie as mudanças para o repositório remoto**:
   git push origin main

Aqui está um exemplo completo dos comandos:

git checkout main
git pull origin main
git merge nome-da-branch-do-seu-amigo
# Resolva quaisquer conflitos aqui
git commit -m "Resolvendo conflitos e mesclando a branch do amigo" # Se necessário
git push origin main
