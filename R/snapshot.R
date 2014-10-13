snapshot<-function(g,t){
  snap<-g
  nodes<-get.vertex.attribute(snap,'TOB')<t&get.vertex.attribute(snap,'TOD')>t
  try(snap<-g%s%which(nodes))
  del.edges<-get.edge.attribute(snap,'FormTime')>t|get.edge.attribute(snap,'DisTime')<t
  if(sum(del.edges)>=1){snap<-delete.edges(snap,which(del.edges))}
  set.vertex.attribute(snap,'age',t-get.vertex.attribute(snap,'TOB'))
}