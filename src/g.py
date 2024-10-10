import subprocess

# output = subprocess.run(["git", "pull"], capture_output=True)
# print(f"{output.stdout.decode()}")

GIT_COMMAND = "git"
GIT_BRANCH = "branch"

def git_branch(branch_name:str) -> str:
    result =  subprocess.run([GIT_COMMAND, GIT_BRANCH, branch_name], capture_output=True)
    if result.stderr.decode() != "": return result.stderr.decode()
    return result.stdout.decode()

#main script
print(git_branch("tmp2"))
