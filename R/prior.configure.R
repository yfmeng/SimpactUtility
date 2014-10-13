prior.configure<-function(type){
  
  # The following depends on formation.hazard.type = simple
  # formation.hazard.simple.alpha_0
  # formation.hazard.simple.alpha_1
  # formation.hazard.simple.alpha_2
  # formation.hazard.simple.alpha_3
  # formation.hazard.simple.alpha_4
  # formation.hazard.simple.alpha_5
  # formation.hazard.simple.alpha_6
  # formation.hazard.simple.alpha_7
  # formation.hazard.simple.Dp
  # formation.hazard.simple.beta
  # formation.hazard.simple.t_max
  #
  # The following depends on intervention.enabled = yes
  # intervention.baseconfigname
  # intervention.times
  # intervention.fileids
  #
  # The following depends on person.agegap.man.dist.type = beta
  # person.agegap.man.dist.beta.a
  # person.agegap.man.dist.beta.b
  # person.agegap.man.dist.beta.min
  # person.agegap.man.dist.beta.max
  #
  # The following depends on person.agegap.man.dist.type = gamma
  # person.agegap.man.dist.gamma.a
  # person.agegap.man.dist.gamma.b
  #
  # The following depends on person.agegap.man.dist.type = lognormal
  # person.agegap.man.dist.lognormal.zeta
  # person.agegap.man.dist.lognormal.sigma
  #
  # The following depends on person.agegap.man.dist.type = uniform
  # person.agegap.man.dist.uniform.min
  # person.agegap.man.dist.uniform.max
  #
  # The following depends on person.agegap.woman.dist.type = beta
  # person.agegap.woman.dist.beta.a
  # person.agegap.woman.dist.beta.b
  # person.agegap.woman.dist.beta.min
  # person.agegap.woman.dist.beta.max
  #
  # The following depends on person.agegap.woman.dist.type = gamma
  # person.agegap.woman.dist.gamma.a
  # person.agegap.woman.dist.gamma.b
  #
  # The following depends on person.agegap.woman.dist.type = lognormal
  # person.agegap.woman.dist.lognormal.zeta
  # person.agegap.woman.dist.lognormal.sigma
  #
  # The following depends on person.agegap.woman.dist.type = uniform
  # person.agegap.woman.dist.uniform.min
  # person.agegap.woman.dist.uniform.max
  #
  # The following depends on person.eagerness.dist.type = beta
  # person.eagerness.dist.beta.a
  # person.eagerness.dist.beta.b
  # person.eagerness.dist.beta.min
  # person.eagerness.dist.beta.max
  #
  # The following depends on person.eagerness.dist.type = gamma
  # person.eagerness.dist.gamma.a
  # person.eagerness.dist.gamma.b
  #
  # The following depends on person.eagerness.dist.type = lognormal
  # person.eagerness.dist.lognormal.zeta
  # person.eagerness.dist.lognormal.sigma
  #
  # The following depends on person.eagerness.dist.type = uniform
  # person.eagerness.dist.uniform.min
  # person.eagerness.dist.uniform.max
  #
  # The following depends on person.vsp.model.logbinormal.usealternativeseeddist = yes
  # person.vsp.model.logbinormal.alternativeseed.dist.type
  #
  # The following depends on person.vsp.model.logbinormal.alternativeseed.dist.type = beta
  # person.vsp.model.logbinormal.alternativeseed.dist.beta.a
  # person.vsp.model.logbinormal.alternativeseed.dist.beta.b
  # person.vsp.model.logbinormal.alternativeseed.dist.beta.min
  # person.vsp.model.logbinormal.alternativeseed.dist.beta.max
  #
  # The following depends on person.vsp.model.logbinormal.alternativeseed.dist.type = fixed
  # person.vsp.model.logbinormal.alternativeseed.dist.fixed.value
  #
  # The following depends on person.vsp.model.logbinormal.alternativeseed.dist.type = gamma
  # person.vsp.model.logbinormal.alternativeseed.dist.gamma.a
  # person.vsp.model.logbinormal.alternativeseed.dist.gamma.b
  #
  # The following depends on person.vsp.model.logbinormal.alternativeseed.dist.type = lognormal
  # person.vsp.model.logbinormal.alternativeseed.dist.lognormal.zeta
  # person.vsp.model.logbinormal.alternativeseed.dist.lognormal.sigma
  #
  # The following depends on person.vsp.model.logbinormal.alternativeseed.dist.type = uniform
  # person.vsp.model.logbinormal.alternativeseed.dist.uniform.min
  # person.vsp.model.logbinormal.alternativeseed.dist.uniform.max
  #
  # The following depends on person.vsp.model.type = logweibullwithnoise
  # person.vsp.model.logweibullwithnoise.weibullscale
  # person.vsp.model.logweibullwithnoise.weibullshape
  # person.vsp.model.logweibullwithnoise.fracsigma
  # person.vsp.model.logweibullwithnoise.onnegative
  #
  
  # Duration of the acute stage. 3 months = 3/12 = 0.25
  chronicstage.acutestagetime                                  = 0.25
  
  # Age at which a person becomes sexually active and can form
  # relationships
  debut.debutage                                               = 15
  
  # These are the parameters for the hazard in the dissolution event.
  # see http://research.edm.uhasselt.be/~jori/simpact/documentation/simpactcyan.html
  # for more information.
  dissolution.alpha_0                                          = 0.1
  dissolution.alpha_1                                          = 0
  dissolution.alpha_2                                          = 0
  dissolution.alpha_3                                          = 0
  dissolution.alpha_4                                          = 0
  dissolution.alpha_5                                          = 0
  dissolution.Dp                                               = 0
  dissolution.beta                                             = 0
  dissolution.t_max                                            = 200
  
  # Valid values are: ['simple', 'agegap']
  formation.hazard.type                                        = agegap
  
  # The following depends on formation.hazard.type = agegap
  # These are the parameters for the hazard in the 'agegap' formation event.
  # see http://research.edm.uhasselt.be/~jori/simpact/documentation/simpactcyan.html
  # for more information.
  formation.hazard.agegap.baseline                             = 0.1
  formation.hazard.agegap.numrel_man                           = 0
  formation.hazard.agegap.numrel_woman                         = 0
  formation.hazard.agegap.numrel_diff                          = 0
  formation.hazard.agegap.meanage                              = 0
  formation.hazard.agegap.eagerness_sum                        = 0
  formation.hazard.agegap.eagerness_diff                       = 0
  formation.hazard.agegap.gap_factor_man                       = 0
  formation.hazard.agegap.gap_agescale_man                     = 0
  formation.hazard.agegap.gap_factor_woman                     = 0
  formation.hazard.agegap.gap_agescale_woman                   = 0
  formation.hazard.agegap.beta                                 = 0
  formation.hazard.agegap.t_max                                = 200
  
  # If you enable the intervention event, you need to specify a number of times
  # at which this event should fire. On these times, some new configuration lines
  # will be read, overriding the initial parameters read from config file.
  # Valid values are: ['yes', 'no']
  intervention.enabled                                         = no
  
  # When someone dies, a new person is introduced to keep the population
  # size constant. Set the following parameter to negative to use the gender 
  # of the deceased person for the new person. Otherwise a random number is 
  # chosen from [0,1], and if smaller than this boygirlratio, a new man is 
  # introduced in the population. Otherwise, a woman is added to the population.
  # 
  # Default is 1.0/2.01
  mortality.base.boygirlratio                                  = 0.4975124378
  
  # Parameters for the calculation of the survival time from the
  # # set-point viral load: t_surv = C/Vsp^(-k)
  mortality.aids.survtime.C                                    = 1325
  mortality.aids.survtime.k                                    = -0.49
  
  # Parameters for the weibull distribution from which a non-aids
  # time of death is picked.
  mortality.normal.weibull.shape                               = 4
  mortality.normal.weibull.scale                               = 70
  mortality.normal.weibull.genderdiff                          = 5
  
  # Controls when the initial HIV seeders are introduced. If the time is negative,
  # no seeders will be introduced since the event will be ignored (simulation time
  # starts at t = 0).
  hivseed.time                                                 = 0
  hivseed.fraction                                             = 0.2
  
  # The hazard of transmission is h = exp(a + b * V^(-c) + d1*Pi + d2*Pj), 
  # where V can be either the set-point viral load or the acute stage 
  # viral load. 
  # 
  # Default parameters originate from a fit to the Lingappa et al. data.
  transmission.param.a                                         = -1.3997
  transmission.param.b                                         = -12.022
  transmission.param.c                                         = 0.1649
  transmission.param.d1                                        = 0
  transmission.param.d2                                        = 0
  
  # A person receives treatment after a certain fraction of t_surv has passed.
  # The effect will be to lower the set-point viral load in such a way that
  # on a log scale the Vsp value will be multiplied by the specified fraction.
  treatment.fraction.time                                      = 0.8
  treatment.fraction.log_viralload                             = 0.7
  # Valid values are: ['yes', 'no']
  treatment.enabled                                            = yes
  
  logsystem.filename.events                                    = 
    logsystem.filename.persons                                   = 
    logsystem.filename.relations                                 = 
    
    # Valid values are: ['beta', 'fixed', 'lognormal', 'gamma', 'uniform']
    person.agegap.man.dist.type                                  = fixed
  
  # The following depends on person.agegap.man.dist.type = fixed
  person.agegap.man.dist.fixed.value                           = 0
  
  # Valid values are: ['beta', 'fixed', 'lognormal', 'gamma', 'uniform']
  person.agegap.woman.dist.type                                = fixed
  
  # The following depends on person.agegap.woman.dist.type = fixed
  person.agegap.woman.dist.fixed.value                         = 0
  
  # The per-person parameter for the eagerness to form a relationship is chosen
  # from a specific distribution with certain parameters.
  # Valid values are: ['beta', 'fixed', 'lognormal', 'gamma', 'uniform']
  person.eagerness.dist.type                                   = fixed
  
  # The following depends on person.eagerness.dist.type = fixed
  person.eagerness.dist.fixed.value                            = 0
  
  # The viral load during the acute stage is based on the set point viral load:
  #    V = [ max(ln(x)/b + Vsp^(-c), maxvalue^(-c)) ]^(-1/c)
  # The b and c parameters are specified in the parameters from the transmission
  # event.
  person.vsp.toacute.x                                         = 10
  person.vsp.maxvalue                                          = 1000000000
  
  # The type of model to use for the Vsp value of the seeders and for inheriting
  # Vsp values.
  # Valid values are: ['logweibullwithnoise', 'logbinormal']
  person.vsp.model.type                                        = logbinormal
  
  # The following depends on person.vsp.model.type = logbinormal
  # Both the initial 'seed' value and the inherited Vsp value are
  # chosen so that the 2D distribution is a clipped binormal distribution 
  # (on a log scale). The shape parameters (mean, sigma), clipping parameters 
  # (min, max) and the correlation parameter (rho) are all configurable here.
  # 
  # Additionally, you can also specify that an alternative distribution must
  # be used to pick the Vsp values of the seeders. Note that these will also
  # be limited to the (min,max) interval.
  person.vsp.model.logbinormal.mean                            = 4
  person.vsp.model.logbinormal.sigma                           = 1
  person.vsp.model.logbinormal.rho                             = 0.33
  person.vsp.model.logbinormal.min                             = 1
  person.vsp.model.logbinormal.max                             = 8
  # Valid values are: ['yes', 'no']
  person.vsp.model.logbinormal.usealternativeseeddist          = no
  
  population.nummen                                            = 100
  population.numwomen                                          = 100
  population.simtime                                           = 15
  population.agedistfile                                       = 
}