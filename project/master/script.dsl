nodo1.run("backup.sh")
nodo2.run("backup.sh")
nodo3.run("backup.sh")

deploy app1 to grupoA
deploy app2 to grupoB

nodo1.temp > 30 -> nodo1.run("update.sh")
nodo2.cpu < 50 -> nodo2.run("deploy.sh")

parallel {
    nodo1.run("update.sh")
    nodo2.run("update.sh")
    nodo3.run("update.sh")
}
