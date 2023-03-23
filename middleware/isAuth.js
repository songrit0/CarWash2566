var accessTokens
var mode
if (typeof window !== 'undefined') {
  accessTokens = localStorage.getItem('acessToken')
  mode = localStorage.getItem('mode')
}

export default async function ({ store, redirect }) {
  if (!accessTokens) {
    localStorage.setItem('acessToken','LIVE')
  }
  if(!mode){
    localStorage.setItem('mode','LIVE')
  }
  else{

  }
}
