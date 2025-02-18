# Shellshock-Lab
This is an application vulnerable to shellshock.

## 2 Ways to use this lab

### 1. Pull The Lab with the below command
```
docker run -d -p 8080:80 mrxcrypt/shellshock-lab
```

OR

### 2. Using this Git Repo
```
git clone https://github.com/misterxcrypt/Shellshock-Lab.git
cd Shellshock-lab
sudo docker build -t shellshock-lab .
sudo docker run -d -p 8080:80 shellshock-lab
```

## Output

The lab is available at https://127.0.0.1:8080/
