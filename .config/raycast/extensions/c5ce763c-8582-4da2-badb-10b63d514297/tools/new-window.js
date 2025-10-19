"use strict";var v=Object.create;var i=Object.defineProperty;var S=Object.getOwnPropertyDescriptor;var E=Object.getOwnPropertyNames;var _=Object.getPrototypeOf,T=Object.prototype.hasOwnProperty;var A=(e,r)=>{for(var n in r)i(e,n,{get:r[n],enumerable:!0})},h=(e,r,n,o)=>{if(r&&typeof r=="object"||typeof r=="function")for(let a of E(r))!T.call(e,a)&&a!==n&&i(e,a,{get:()=>r[a],enumerable:!(o=S(r,a))||o.enumerable});return e};var c=(e,r,n)=>(n=e!=null?v(_(e)):{},h(r||!e||!e.__esModule?i(n,"default",{value:e,enumerable:!0}):n,e)),R=e=>h(i({},"__esModule",{value:!0}),e);var N={};A(N,{default:()=>L});module.exports=R(N);var p=c(require("node:process"),1),m=require("node:util"),l=require("node:child_process"),P=(0,m.promisify)(l.execFile);async function u(e,{humanReadableOutput:r=!0,signal:n}={}){if(p.default.platform!=="darwin")throw new Error("macOS only");let o=r?[]:["-ss"],a={};n&&(a.signal=n);let{stdout:x}=await P("osascript",["-e",e,o],a);return x.trim()}var d=require("@raycast/api");var s=c(require("react")),t=require("@raycast/api");var g=require("react/jsx-runtime");var $=c(require("fs"));var f=c(require("path"));var C=require("@raycast/api"),I=()=>{if(!process.env.HOME)throw new Error("$HOME environment variable is not set.");return f.default.join(process.env.HOME,"Library")};var b=()=>f.default.join(I(),...y);var U=()=>{try{let e=b(),r=$.default.readFileSync(e,"utf-8"),n=JSON.parse(r).profile.info_cache;return n?Object.keys(n)[0]:"Default"}catch{return"Default"}};var y=["Application Support","Google","Chrome","Local State"],O=U();async function w(){await u(`
    tell application "Google Chrome"
      make new window
      activate
    end tell
    return true
  `)}async function k(e){await u(`
    tell application "Google Chrome"
      activate
      open location "${e}"
    end tell
    return true
  `)}async function L(e){return e.website?(await k(e.website),`Opening new window to ${e.website}`):(await w(),"Opening new window")}
