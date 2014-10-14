snapshot<-function(g,t){
  snap<-g
  nodes<-get.vertex.attribute(snap,'TOB')<t&get.vertex.attribute(snap,'TOD')>t
  snap<-tryCatch({snap<-g%s%which(nodes)},
              error=function(eer){
                print('No individuals at time t')
                snape<-g
              })
  snap<-tryCatch({
                  del.edges<-get.edge.attribute(snap,'FormTime')>t|get.edge.attribute(snap,'DisTime')<t
                  snap<-delete.edges(snap,which(del.edges))},
                 error=function(eer){})
  
  set.vertex.attribute(snap,'age',t-get.vertex.attribute(snap,'TOB'))
}