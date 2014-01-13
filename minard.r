# Original project/data source: http://www.datavis.ca/gallery/minard/ggplot2/ggplot2-minard-gallery.zip

drawGroup <- function(troops, groupNum) {
  maxSurvivors <- max(troops$survivors)
  advanceTroops <- troops[troops$direction=='A' & troops$group==groupNum,]
  retreatTroops <- troops[troops$direction=='R' & troops$group==groupNum,]
  plot(advanceTroops[,c('long','survivors')], main=paste("Advance, Group ", groupNum), ylab="Number of Soldiers", ylim=c(0,maxSurvivors), cex=0, xlab="Longitude")
  lines(advanceTroops[,c('long','survivors')], col="#e8a830", lwd=2)
  
  plot(retreatTroops[,c('long', 'survivors')], main=paste("Retreat, Group", groupNum), ylab="Number of Soldiers", ylim=c(0,maxSurvivors), cex=0, xlab="Longitude")
  lines(retreatTroops[,c('long', 'survivors')], col="black", lwd=2)
}

troops <- read.table("troops.txt", header=T)
cities <- read.table("cities.txt", header=T)
temps <- read.table("temps.txt", header=T)
temps$date <- as.Date(strptime(temps$date,"%d%b%Y"))

#borders <- data.frame(map("world", xlim=c(10,50), ylim=c(40, 80), plot=F)[c("x","y")])
#points(x=troops$long, y=troops$lat, col='red')

maxSurvivors <- max(troops$survivors)
par(mar=c(5,5,3,2), mfrow=c(3,2))
drawGroup(troops, 1)
drawGroup(troops, 2)
drawGroup(troops, 3)

par(mar=c(5,5,5,2), mfrow=c(1,1))
plot(temps$date, temps$temp, main="Temperature During The Retreat", ylab="Degrees Celcius", xlab="Date in 1812", cex=0.5)
lines(temps$date, temps$temp)
