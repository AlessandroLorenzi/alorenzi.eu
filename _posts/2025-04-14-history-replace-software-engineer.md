---
title: "Re: The 10 times in history that software engineers were to be replaced"
description: "Una risposta sul mio vissuto"
image: /media/posts/2025-04-14-history-replace-software-engineer/infographic.jpg
---

Mi é capitato sott'occhio questo [articolo](https://strategizeyourcareer.com/p/the-10-times-in-history-that-software) con un'infografica interessante.

![infografica](/media/posts/2025-04-14-history-replace-software-engineer/infographic.jpg)

É innegabile che abbia ragione, ci sono stati dei nodi nella storia dell'informatica che sul momento potevano sembrare spaventosi, che avrebbero portato solo uno sparuto gruppo di professionisti a lavorare lasciando a casa il resto delle persone.

Vorrei solo analizzare gli ultimi punti della lista, quelli che ho vissuto da utente o da professionista.

### The internet, web browsers & scripting languages (1990-2010)

Ovviamente l'internet é stata l'invenzione che ha cambiato il mondo, su questo non ci piove. Ma non c'era bisogno di internet per far lavorare piú persone sulla stessa macchina. I dumb terminal che si collegavano al mainframe sono stati inventati negli anni 70, tante persone potevano lavorare sul proprio terminale (schermo e tastiera) collegati tutti allo stesso computer. I dati erano centralizzati, il software veniva eseguito nello stesso posto.

![the internet from it crowd](https://vignette.wikia.nocookie.net/theitcrowd/images/9/92/FR55S2JG4PBP7TA.MEDIUM.jpg/revision/latest?cb=20151230224259)

Giusto questa mattina sono andato a fare una visita medica e poi sono andato dalla polizia locale come testimone di un incidente. In entrambi i casi la rete era fuori uso, da una parte non potevano fare ricette (ma i vecchi ricettari come backup no?) e dall'altra hanno preso la testimonianza a mano.

E girando spesso per ospedali non é la prima volta che capita di avere rallentamenti o blocchi.

### Frameworks, libraries, IDE enhancements & open source (Late 1990s-2010s)

Metterei queste cose in categorie separate.

I **framework** hanno astratto molto lavoro noioso permettendo al professionista di lavorare piú sulla logica che sulla costruzione.

Peró abbiamo lati negativi. C'é una vasta scelta di framework tra cui scegliere per ogni linguaggio di programmazione e ogniuno si porta dietro la sua logica e le sue peculiaritá. Come scegliere un framework? Si sceglie di solito per il bisogno immediato nel momento in cui parte un progetto.

Ho visto progetti evolvere, a volte un uso scorretto del framework si trascina nel tempo con i copia-incolla, si deriva dalle best practice del fw, a volte diventa limitato o ci si accorge che sono piú le risorse necessarie a mantenere il framework che le funzionalitá stesse del software.

Per non parlare poi di quando esce una nuova versione del framework e andrebbe riscritto mezzo progetto perché sono cambiati i paradigmi o quelle best practice non adottate adesso sono deprecation. Tutto debito tecnico che sul lungo periodo rappresenta un freno a mano tirato.

Esiste anche il movimento [frameworkless](https://www.frameworklessmovement.org/) che suggerisce di sviluppare le applicazioni senza framework per avere un codice piú essenziale che cresce e si evolve naturalmente con i bisongni.

Altro discorso per **librerie** e **opensource**. Vengono usate tonnellate di librerie non mantenute, oppure, come il buon xkcd ci insegna, tutta l'infrastruttura digitale moderna tenuta in piedi da un progetto mantenuto da un tizio in nebraska dal 2003. 

![vignetta da xkcd: dependency, tutta l'infrastruttura digitale moderna tenuta in piedi da un progetto mantenuto da un tizio in nebraska dal 2003](https://imgs.xkcd.com/comics/dependency_2x.png)

Le aziende che usano l'opensource dovrebbero decisamente fare di piú per sostenere i progetti che utilizzano.

### Cloud computing (Mid-2000s onwards)

> nines don’t matter
> (Charity Major)

I "nines" sono riferiti all'uptime. 99% di uptime vuol dire che il servizio puó stare giú 7 ore al mese, 99.9% circa tre quarti d'ora, 99.99% circa 4 minuti e cosí via.

D'altra parte abbiamo i picchi di traffico, metti che fai il black friday, e allora quel giorno decuplichi i visitatori di una giornata normale. Allora sicuramente va giú il sito. Per evitare questo devi scalare.

Per rispondere a queste esigenze allora serve il cloud, il computer di qualcun altro, agevolmente affittato con billing orario. Quindi hai alcuni servizi gestiti da loro, ad esempio i database che sono rognosissimi. D'altra parte se hai il picco di traffico noleggi per un paio d'ore un altro server e scali in maniera automatica.

Poi ti scontri con la realtá, che stai pagando le risorse in maniera esagerata. Che con la spesa in cloud di un paio di mesi potresti comprarti tutto l'hardware che potrai ammortizzare fiscalmente nei prossimi cinque anni (qui viene fuori l'anima da ragioniere) e poi l'affitto annuiale di un mezzo rack lo paghi quanto mezzo billing cloud. E in quell'hardware, server ridondati, c'é spazio sia per far crescere il businnes che per affrontare i picchi di traffico futuri.

E per inciso, gestire un database postgres non é cosí un pianto quando assumi persone che sanno fare il loro lavoro.



### DevOps (Mid-2000s onwards)

Anche il mito dei "DevOps" é morto. L'idea era giusta ma si é scontrata con un 
