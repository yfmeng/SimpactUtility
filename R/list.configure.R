list.configure<-function(){
cfg<-list()
cfg['chronicstage.acutestagetime']<-0.25

#Ageatwhichapersonbecomessexuallyactiveandcanform
#relationships
cfg['debut.debutage']<-15

#Thesearetheparametersforthehazardinthedissolutionevent.
#seehttp://research.edm.uhasselt.be/~jori/simpact/documentation/simpactcyan.html
#formoreinformation.
cfg['dissolution.alpha_0']<-0.1
cfg['dissolution.alpha_1']<-0
cfg['dissolution.alpha_2']<-0
cfg['dissolution.alpha_3']<-0
cfg['dissolution.alpha_4']<-0
cfg['dissolution.alpha_5']<-0
cfg['dissolution.Dp']<-0
cfg['dissolution.beta']<-0
cfg['dissolution.t_max']<-200

#Validvaluesare:['simple','agegap']
cfg['formation.hazard.type<-agegap']

#Thefollowingdependsonformation.hazard.type<-agegap
#Thesearetheparametersforthehazardinthe'agegap'formationevent.
#seehttp://research.edm.uhasselt.be/~jori/simpact/documentation/simpactcyan.html
#formoreinformation.
cfg['formation.hazard.agegap.baseline']<-0.1
cfg['formation.hazard.agegap.numrel_man']<-0
cfg['formation.hazard.agegap.numrel_woman']<-0
cfg['formation.hazard.agegap.numrel_diff']<-0
cfg['formation.hazard.agegap.meanage']<-0
cfg['formation.hazard.agegap.eagerness_sum']<-0
cfg['formation.hazard.agegap.eagerness_diff']<-0
cfg['formation.hazard.agegap.gap_factor_man']<-0
cfg['formation.hazard.agegap.gap_agescale_man']<-0
cfg['formation.hazard.agegap.gap_factor_woman']<-0
cfg['formation.hazard.agegap.gap_agescale_woman']<-0
cfg['formation.hazard.agegap.beta']<-0
cfg['formation.hazard.agegap.t_max']<-200

#Ifyouenabletheinterventionevent,youneedtospecifyanumberoftimes
#atwhichthiseventshouldfire.Onthesetimes,somenewconfigurationlines
#willberead,overridingtheinitialparametersreadfromconfigfile.
#Validvaluesare:['yes','no']
cfg['intervention.enabled']<-'no'

#Whensomeonedies,anewpersonisintroducedtokeepthepopulation
#sizeconstant.Setthefollowingparametertonegativetousethegender
#ofthedeceasedpersonforthenewperson.Otherwisearandomnumberis
#chosenfrom[0,1],andifsmallerthanthisboygirlratio,anewmanis
#introducedinthepopulation.Otherwise,awomanisaddedtothepopulation.
#
#Defaultis1.0/2.01
cfg['mortality.base.boygirlratio']<-0.4975124378

#Parametersforthecalculationofthesurvivaltimefromthe
##set-pointviralload:t_surv<-C/Vsp^(-k)
cfg['mortality.aids.survtime.C']<-1325
cfg['mortality.aids.survtime.k']<--0.49

#Parametersfortheweibulldistributionfromwhichanon-aids
#timeofdeathispicked.
cfg['mortality.normal.weibull.shape']<-4
cfg['mortality.normal.weibull.scale']<-70
cfg['mortality.normal.weibull.genderdiff']<-5

#ControlswhentheinitialHIVseedersareintroduced.Ifthetimeisnegative,
#noseederswillbeintroducedsincetheeventwillbeignored(simulationtime
#startsatt<-0).
cfg['hivseed.time']<-0
cfg['hivseed.fraction']<-0.2

#Thehazardoftransmissionish<-exp(a+b*V^(-c)+d1*Pi+d2*Pj),
#whereVcanbeeithertheset-pointviralloadortheacutestage
#viralload.
#
#DefaultparametersoriginatefromafittotheLingappaetal.data.
cfg['transmission.param.a']<--1.3997
cfg['transmission.param.b']<--12.022
cfg['transmission.param.c']<-0.1649
cfg['transmission.param.d1']<-0
cfg['transmission.param.d2']<-0

#Apersonreceivestreatmentafteracertainfractionoft_survhaspassed.
#Theeffectwillbetolowertheset-pointviralloadinsuchawaythat
#onalogscaletheVspvaluewillbemultipliedbythespecifiedfraction.
cfg['treatment.fraction.time']<-0.8
cfg['treatment.fraction.log_viralload']<-0.7
#Validvaluesare:['yes','no']
cfg['treatment.enabled']<-'yes'

cfg['logsystem.filename.events']<-
cfg['logsystem.filename.persons']<-
cfg['logsystem.filename.relations']<-

#Validvaluesare:['beta','fixed','lognormal','gamma','uniform']
cfg['person.agegap.man.dist.type']<-'fixed'

#Thefollowingdependsonperson.agegap.man.dist.type<-fixed
cfg['person.agegap.man.dist.fixed.value']<-0

#Validvaluesare:['beta','fixed','lognormal','gamma','uniform']
cfg['person.agegap.woman.dist.type']<-'fixed'

#Thefollowingdependsonperson.agegap.woman.dist.type<-fixed
cfg['person.agegap.woman.dist.fixed.value']<-0

#Theper-personparameterfortheeagernesstoformarelationshipischosen
#fromaspecificdistributionwithcertainparameters.
#Validvaluesare:['beta','fixed','lognormal','gamma','uniform']
cfg['person.eagerness.dist.type']<-'fixed'

#Thefollowingdependsonperson.eagerness.dist.type']<-fixed
cfg['person.eagerness.dist.fixed.value']<-0

#Theviralloadduringtheacutestageisbasedonthesetpointviralload:
#V<-[max(ln(x)/b+Vsp^(-c),maxvalue^(-c))]^(-1/c)
#Thebandcparametersarespecifiedintheparametersfromthetransmission
#event.
cfg['person.vsp.toacute.x']<-10
cfg['person.vsp.maxvalue']<-1000000000

#ThetypeofmodeltousefortheVspvalueoftheseedersandforinheriting
#Vspvalues.
#Validvaluesare:['logweibullwithnoise','logbinormal']
cfg['person.vsp.model.type']<-'logbinormal'

#Thefollowingdependsonperson.vsp.model.type<-logbinormal
#Boththeinitial'seed'valueandtheinheritedVspvalueare
#chosensothatthe2Ddistributionisaclippedbinormaldistribution
#(onalogscale).Theshapeparameters(mean,sigma),clippingparameters
#(min,max)andthecorrelationparameter(rho)areallconfigurablehere.
#
#Additionally,youcanalsospecifythatanalternativedistributionmust
#beusedtopicktheVspvaluesoftheseeders.Notethatthesewillalso
#belimitedtothe(min,max)interval.
cfg['person.vsp.model.logbinormal.mean']<-4
cfg['person.vsp.model.logbinormal.sigma']<-1
cfg['person.vsp.model.logbinormal.rho']<-0.33
cfg['person.vsp.model.logbinormal.min']<-1
cfg['person.vsp.model.logbinormal.max']<-8
#Validvaluesare:['yes','no']
cfg['person.vsp.model.logbinormal.usealternativeseeddist']<-'no'

cfg['population.nummen']<-100
cfg['population.numwomen']<-100
cfg['population.simtime']<-15
cfg['population.agedistfile']<-''
cfg
}