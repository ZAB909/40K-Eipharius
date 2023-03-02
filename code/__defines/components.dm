//shorthand
#define GET_COMPONENT_FROM(varname, path, target) var##path/##varname = ##target.GetComponent(##path)
#define GET_COMPONENT(varname, path) GET_COMPONENT_FROM(varname, path, src)

// All signals. Format:
// When the signal is called: (signal arguments)

#define COMSIG_PARENT_QDELETED "parent_qdeleted"				//before a datum's Destroy() is called: ()
#define COMSIG_UNARMEDATTACK "UnarmedAttack"