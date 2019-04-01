export const add = function (state,params) {
  const result = {...state,age:state.age+1}
  return result
}
export const cancel = function (state,params) {
  const result = {...state,age:state.age-1}
  return result
}
export const changename = function(state,params,p){
  return {
    ...state,
    name:state.name+params+p
  }
}