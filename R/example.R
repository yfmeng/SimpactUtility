# preperation
# if any of the packages are not installed :
install.packages('devtools')
library(devtools)
# install from git
install_github(repo="SimpactUtility",username='yfmeng')
install.packages("simpact", repos="http://research.edm.uhasselt.be/jori")
install.packages('network')

library(simpact)
library(SimpactUtility)
library(EasyABC)
# setup the working directory as you wish
folder<- '/Users/feimeng/SimpactUtility/test'
setwd(folder)

###################################
#### easy configuration with uni.configure
###################################

# change single/multiple input parameters
cfg.1<-list()
cfg.1[['formation.hazard.agegap.baseline']]<-0.11
cfg.1[['hivseed.fraction']]<-0.1
test.1<-simpact.run(uni.configure(cfg.1),folder)

# or use keyboard
# following the instruction, try type 
# >>formation.hazard.agegap.baseline
# >>0.15
# exit keyboard with an enter
test.2<-simpact.run(uni.configure(),folder)

# uni.configure can also reads data frame and .csv files 


###################################
#### use ABC
###################################

#### configuration of targets  ####
# the target variable and target value is defined in simpact.abc.target
# for this testing version number of relationships is chosen
# you can overwrite simpact.abc.target if other targets is needed
# I will try to make it more convinient to change this function
sum_stat_obs <- c(350)

#### configuration of prior ####
# define the input parameter(s) you want to vary
# eg.
v.cfg<-list()
v.cfg[['formation.hazard.agegap.baseline']]<-c('unif',0.1,0.2)
v.cfg[['dissolution.alpha_0']]<-c('normal',0.15,0.03)
# then get the prior using prior.configure
prior.1<-prior.configure(v.cfg)

# if the you also want to change the fixed parameters
# e.g.
fix.cfg<-list()
fix.cfg[['dissolution.alpha_0']]<-0.01

prior.2<-prior.configure(v.cfg,fixed=fix.cfg)
n_init <- 40
alpha <- 0.5
pacc <- 0.02

# name of the model is simpact.abc.model
test.ABC.1 <- ABC_sequential(method="Lenormand",
                                model=simpact.abc.model,
                                prior=prior.1,
                                nb_simul=n_init,
                                summary_stat_target=sum_stat_obs,
                                alpha=alpha,
                                p_acc_min=pacc,
                                verbose=FALSE)
test.ABC.2 <- ABC_sequential(method="Lenormand",
                             model=simpact.abc.model,
                             prior=prior.2,
                             nb_simul=n_init,
                             summary_stat_target=sum_stat_obs,
                             alpha=alpha,
                             p_acc_min=pacc,
                             verbose=FALSE)

hist(test.ABC.1$param[,1])
hist(test.ABC.2$param[,1])


#############################
#### run a toy Simpact plot with shiny
#############################

###### other users can run from github
library(shiny)
runGitHub( repo="SimpactShiny", username="yfmeng", subdir = "plot/simpact.toy/") 

# or run locally 
# first find the directory of simpact.toy 
#e.g:
folder<-'/Users/feimeng/SimpactShiny/plot'
app.address<-sprintf('%s/simpact.toy',folder)
runApp(app.address)

#############################
#### a bite of shiny plots
#############################

# specify where are the shiny Apps:
folder<-'/Users/feimeng/SimpactShiny/plot'
type<-'network'
simpact.shiny.plot(type,folder)
# I put some test output files in the folder ~/SimpactUtility/plot/data
# give the directory to "Directory" text box, e.g.'/Users/feimeng/SimpactUtility/plot/data'
# and the log file index to "Index of the log files", such as "test1" or "test2"
# there is a little app for HIV prevalence too
simpact.shiny.plot('prevalence',folder)

