require(network)
require(sna)
network.summary<-function(g){
  # some summarising network features
  # g is a network converted by f<-simpact2network(logfile)
 s<-list()
 Nv<-network.size(g)
 s['size']<-Nv
 s['no.males']<-sum(get.vertex.attribute(g,'Gender')==0)
 s['no.females']<-Nv-s$no.males
 s['density']<-network.density(g)
 s['isolate']<-sum(degree(g,gmode='graph')==0)
 s['mean.degree']<-mean(degree(g,gmode='graph'))
 s['median.degree']<-median(degree(g,gmode='graph'))
 comps<-component.dist(g)$membership
 s[['components']]<-table(comps)
 s['giant']<-sum(component.largest(g))
 s['connectedness']<-connectedness(g)
 s['efficiency']<-efficiency(g)
 s
}