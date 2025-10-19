"use strict";var Ge=Object.create;var W=Object.defineProperty;var He=Object.getOwnPropertyDescriptor;var Ke=Object.getOwnPropertyNames;var Je=Object.getPrototypeOf,Ze=Object.prototype.hasOwnProperty;var qe=(e,t)=>{for(var r in t)W(e,r,{get:t[r],enumerable:!0})},le=(e,t,r,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let a of Ke(t))!Ze.call(e,a)&&a!==r&&W(e,a,{get:()=>t[a],enumerable:!(n=He(t,a))||n.enumerable});return e};var O=(e,t,r)=>(r=e!=null?Ge(Je(e)):{},le(t||!e||!e.__esModule?W(r,"default",{value:e,enumerable:!0}):r,e)),Ye=e=>le(W({},"__esModule",{value:!0}),e);var kt={};qe(kt,{default:()=>De});module.exports=Ye(kt);var Z=require("@raycast/api"),Ne=require("react");var tt=require("@raycast/api");var de=O(require("fs"));var X=O(require("path"));var Xe=require("@raycast/api"),Qe=()=>{if(!process.env.HOME)throw new Error("$HOME environment variable is not set.");return X.default.join(process.env.HOME,"Library")};var ue=()=>X.default.join(Qe(),...fe);var et=()=>{try{let e=ue(),t=de.default.readFileSync(e,"utf-8"),r=JSON.parse(t).profile.info_cache;return r?Object.keys(r)[0]:"Default"}catch{return"Default"}};var fe=["Application Support","Google","Chrome","Local State"],V=et(),Q="CHROME_PROFILE_KEY";var he=`
  # \u{1F6A8}Error: Google Chrome browser is not installed
  ## This extension depends on Google Chrome browser. You must install it to continue.

  If you have [Homebrew](https://brew.sh/) installed then press \u23CE (Enter Key) to install Google Chrome browser.

  [Click here](https://www.google.com/chrome/) if you want to download manually.

  [![Google Chrome](https://www.google.com/chrome/static/images/chrome-logo-m100.svg)]()
`;var pe=`
# \u{1F6A8}Error: Something happened while trying to run your command

[![Google Chrome](https://www.google.com/chrome/static/images/chrome-logo-m100.svg)]()
`,z="An Error Occurred",j="Google Chrome not installed";var rt=require("react/jsx-runtime");var be=require("react"),b=require("@raycast/api"),ee=require("child_process");var ge=require("os"),ye=require("path"),B=require("react/jsx-runtime"),nt=(()=>{try{return(0,ee.execSync)("brew --prefix",{encoding:"utf8"}).trim()}catch{return(0,ge.cpus)()[0].model.includes("Apple")?"/opt/homebrew":"/usr/local"}})();function me(){return(0,ye.join)(nt,"bin/brew")}function at(e){try{return(0,ee.execSync)(`${me()} install --cask ${e}`,{maxBuffer:10*1024*1024})}catch(t){let r=t;throw r&&r.code===127?(r.stderr=`Brew executable not found at ${me()}`,r):t}}function $e(){let[e,t]=(0,be.useState)(!0);return(0,B.jsx)(b.Detail,{actions:(0,B.jsx)(b.ActionPanel,{children:e&&(0,B.jsx)(b.Action,{title:"Install with Homebrew",onAction:async()=>{if(!e)return;let r=new b.Toast({style:b.Toast.Style.Animated,title:"Installing..."});await r.show();try{at("google-chrome"),await r.hide()}catch{await r.hide(),await(0,b.showToast)(b.Toast.Style.Failure,z,"An unknown error occurred while trying to install")}r.title="Installed! Please go back and try again.",r.style=b.Toast.Style.Success,await r.show(),t(!1)}})}),markdown:he})}var U=require("@raycast/api");var ke=require("react/jsx-runtime");function we(){return(0,U.showToast)(U.Toast.Style.Failure,z,"Something happened while trying to run your command"),(0,ke.jsx)(U.Detail,{markdown:pe})}var c=require("@raycast/api");var xe=O(require("node:process"),1),ve=require("node:util"),te=require("node:child_process"),ot=(0,ve.promisify)(te.execFile);async function P(e,{humanReadableOutput:t=!0,signal:r}={}){if(xe.default.platform!=="darwin")throw new Error("macOS only");let n=t?[]:["-ss"],a={};r&&(a.signal=r);let{stdout:s}=await ot("osascript",["-e",e,n],a);return s.trim()}var S=require("@raycast/api");var l=O(require("react")),o=require("@raycast/api");var Ee=Object.prototype.hasOwnProperty;function G(e,t){var r,n;if(e===t)return!0;if(e&&t&&(r=e.constructor)===t.constructor){if(r===Date)return e.getTime()===t.getTime();if(r===RegExp)return e.toString()===t.toString();if(r===Array){if((n=e.length)===t.length)for(;n--&&G(e[n],t[n]););return n===-1}if(!r||typeof e=="object"){n=0;for(r in e)if(Ee.call(e,r)&&++n&&!Ee.call(t,r)||!(r in t)||!G(e[r],t[r]))return!1;return Object.keys(t).length===n}}return e!==e&&t!==t}var R=O(require("node:fs")),H=O(require("node:path"));var Ae=require("react/jsx-runtime");var _e=require("node:url");function st(e){let t=(0,l.useRef)(e),r=(0,l.useRef)(0);return G(e,t.current)||(t.current=e,r.current+=1),(0,l.useMemo)(()=>t.current,[r.current])}function y(e){let t=(0,l.useRef)(e);return t.current=e,t}function it(e,t){let r=e instanceof Error?e.message:String(e);return(0,o.showToast)({style:o.Toast.Style.Failure,title:t?.title??"Something went wrong",message:t?.message??r,primaryAction:t?.primaryAction??Se(e),secondaryAction:t?.primaryAction?Se(e):void 0})}var Se=e=>{let t=!0,r="[Extension Name]...",n="";try{let u=JSON.parse((0,R.readFileSync)((0,H.join)(o.environment.assetsPath,"..","package.json"),"utf8"));r=`[${u.title}]...`,n=`https://raycast.com/${u.owner||u.author}/${u.name}`,(!u.owner||u.access==="public")&&(t=!1)}catch{}let a=o.environment.isDevelopment||t,s=e instanceof Error?e?.stack||e?.message||"":String(e);return{title:a?"Copy Logs":"Report Error",onAction(u){u.hide(),a?o.Clipboard.copy(s):(0,o.open)(`https://github.com/raycast/extensions/issues/new?&labels=extension%2Cbug&template=extension_bug_report.yml&title=${encodeURIComponent(r)}&extension-url=${encodeURI(n)}&description=${encodeURIComponent(`#### Error:
\`\`\`
${s}
\`\`\`
`)}`)}}};function Pe(e,t,r){let n=(0,l.useRef)(0),[a,s]=(0,l.useState)({isLoading:!0}),u=y(e),d=y(r?.abortable),$=y(t||[]),w=y(r?.onError),k=y(r?.onData),p=y(r?.onWillExecute),x=y(r?.failureToastOptions),g=y(a.data),L=(0,l.useRef)(null),h=(0,l.useRef)({page:0}),q=(0,l.useRef)(!1),Y=(0,l.useRef)(!0),ce=(0,l.useRef)(50),T=(0,l.useCallback)(()=>(d.current&&(d.current.current?.abort(),d.current.current=new AbortController),++n.current),[d]),A=(0,l.useCallback)((...v)=>{let m=T();p.current?.(v),s(i=>({...i,isLoading:!0}));let C=ct(u.current)(...v);function I(i){return i.name=="AbortError"||m===n.current&&(w.current?w.current(i):o.environment.launchType!==o.LaunchType.Background&&it(i,{title:"Failed to fetch latest data",primaryAction:{title:"Retry",onAction(_){_.hide(),L.current?.(...$.current||[])}},...x.current}),s({error:i,isLoading:!1})),i}return typeof C=="function"?(q.current=!0,C(h.current).then(({data:i,hasMore:_,cursor:je})=>(m===n.current&&(h.current&&(h.current.cursor=je,h.current.lastItem=i?.[i.length-1]),k.current&&k.current(i,h.current),_&&(ce.current=i.length),Y.current=_,s(Be=>h.current.page===0?{data:i,isLoading:!1}:{data:(Be.data||[])?.concat(i),isLoading:!1})),i),i=>(Y.current=!1,I(i)))):(q.current=!1,C.then(i=>(m===n.current&&(k.current&&k.current(i),s({data:i,isLoading:!1})),i),I))},[k,w,$,u,s,L,p,h,x,T]);L.current=A;let F=(0,l.useCallback)(()=>{h.current={page:0};let v=$.current||[];return A(...v)},[A,$]),Me=(0,l.useCallback)(async(v,m)=>{let C;try{if(m?.optimisticUpdate){T(),typeof m?.rollbackOnError!="function"&&m?.rollbackOnError!==!1&&(C=structuredClone(g.current?.value));let I=m.optimisticUpdate;s(i=>({...i,data:I(i.data)}))}return await v}catch(I){if(typeof m?.rollbackOnError=="function"){let i=m.rollbackOnError;s(_=>({..._,data:i(_.data)}))}else m?.optimisticUpdate&&m?.rollbackOnError!==!1&&s(i=>({...i,data:C}));throw I}finally{m?.shouldRevalidateAfter!==!1&&(o.environment.launchType===o.LaunchType.Background||o.environment.commandMode==="menu-bar"?await F():F())}},[F,g,s,T]),Fe=(0,l.useCallback)(()=>{h.current.page+=1;let v=$.current||[];A(...v)},[h,$,A]);(0,l.useEffect)(()=>{h.current={page:0},r?.execute!==!1?A(...t||[]):T()},[st([t,r?.execute,A]),d,h]),(0,l.useEffect)(()=>()=>{T()},[T]);let We=r?.execute!==!1?a.isLoading:!1,Ve={...a,isLoading:We},ze=q.current?{pageSize:ce.current,hasMore:Y.current,onLoadMore:Fe}:void 0;return{...Ve,revalidate:F,mutate:Me,pagination:ze}}function ct(e){return e===Promise.all||e===Promise.race||e===Promise.resolve||e===Promise.reject?e.bind(Promise):e}function lt(e,t){let r=this[e];return r instanceof Date?`__raycast_cached_date__${r.toString()}`:Buffer.isBuffer(r)?`__raycast_cached_buffer__${r.toString("base64")}`:t}function ut(e,t){return typeof t=="string"&&t.startsWith("__raycast_cached_date__")?new Date(t.replace("__raycast_cached_date__","")):typeof t=="string"&&t.startsWith("__raycast_cached_buffer__")?Buffer.from(t.replace("__raycast_cached_buffer__",""),"base64"):t}var ft=Symbol("cache without namespace"),Te=new Map;function re(e,t,r){let n=r?.cacheNamespace||ft,a=Te.get(n)||Te.set(n,new o.Cache({namespace:r?.cacheNamespace})).get(n);if(!a)throw new Error("Missing cache");let s=y(e),u=y(t),d=(0,l.useSyncExternalStore)(a.subscribe,()=>{try{return a.get(s.current)}catch(p){console.error("Could not get Cache data:",p);return}}),$=(0,l.useMemo)(()=>{if(typeof d<"u"){if(d==="undefined")return;try{return JSON.parse(d,ut)}catch(p){return console.warn("The cached data is corrupted",p),u.current}}else return u.current},[d,u]),w=y($),k=(0,l.useCallback)(p=>{let x=typeof p=="function"?p(w.current):p;if(typeof x>"u")a.set(s.current,"undefined");else{let g=JSON.stringify(x,lt);a.set(s.current,g)}return x},[a,s,w]);return[$,k]}function K(e,t){let r=n=>n.startsWith("http")?n:`https://${n}`;try{let n=d=>d.startsWith("http")?d:`https://${d}`,s=(typeof e=="string"?new _e.URL(n(e)):e).hostname;switch(process.env.FAVICON_PROVIDER??"raycast"){case"none":return{source:t?.fallback??o.Icon.Link,mask:t?.mask};case"apple":return{source:t?.fallback??o.Icon.Link,mask:t?.mask};case"duckduckgo":case"duckDuckGo":return{source:`https://icons.duckduckgo.com/ip3/${s}.ico`,fallback:t?.fallback??o.Icon.Link,mask:t?.mask};case"google":return{source:`https://www.google.com/s2/favicons?sz=${t?.size??64}&domain=${s}`,fallback:t?.fallback??o.Icon.Link,mask:t?.mask};case"legacy":case"raycast":default:return{source:`https://api.ray.so/favicon?url=${s}&size=${t?.size??64}`,fallback:t?.fallback??o.Icon.Link,mask:t?.mask}}}catch(n){return console.error(n),o.Icon.Link}}var E=class e{constructor(t,r,n,a,s,u){this.title=t;this.url=r;this.favicon=n;this.windowsId=a;this.tabIndex=s;this.sourceLine=u}static TAB_CONTENTS_SEPARATOR="~~~";static parse(t){let r=t.split(this.TAB_CONTENTS_SEPARATOR);return new e(r[0],r[1],r[2],+r[3],+r[4],t)}key(){return`${this.windowsId}${e.TAB_CONTENTS_SEPARATOR}${this.tabIndex}`}urlWithoutScheme(){return this.url.replace(/(^\w+:|^)\/\//,"").replace("www.","")}realFavicon(){return new URL(this.favicon||"/favicon.ico",this.url).href}googleFavicon(){return K(this.url)}};async function Re(e){let t=e?`execute t javascript \xAC
        "document.head.querySelector('link[rel~=icon]') ? document.head.querySelector('link[rel~=icon]').href : '';"`:'""';await ne();try{return(await P(`
      set _output to ""
      tell application "Google Chrome"
        repeat with w in windows
          set _w_id to get id of w as inches as string
          set _tab_index to 1
          repeat with t in tabs of w
            set _title to get title of t
            set _url to get URL of t
            set _favicon to ${t}
            set _output to (_output & _title & "${E.TAB_CONTENTS_SEPARATOR}" & _url & "${E.TAB_CONTENTS_SEPARATOR}" & _favicon & "${E.TAB_CONTENTS_SEPARATOR}" & _w_id & "${E.TAB_CONTENTS_SEPARATOR}" & _tab_index & "\\n")
            set _tab_index to _tab_index + 1
          end repeat
        end repeat
      end tell
      return _output
  `)).split(`
`).filter(n=>n.length!==0).map(n=>E.parse(n))}catch(r){return r.message.includes(`Can't get application "Google Chrome"`)&&S.LocalStorage.removeItem("is-installed"),await ne(),[]}}async function N({url:e,query:t,profileCurrent:r,profileOriginal:n,openTabInProfile:a}){setTimeout(()=>{(0,S.popToRoot)({clearSearchBar:!0})},3e3),await Promise.all([(0,S.closeMainWindow)({clearRootSearch:!0}),ne()]);let s="",u=d=>`
    set profile to quoted form of "${d}"
    set link to quoted form of "${e||"about:blank"}"
    do shell script "open -na 'Google Chrome' --args --profile-directory=" & profile & " " & link
  `;switch(a){case"default":s=`
        set winExists to false
        tell application "Google Chrome"
            repeat with win in every window
                if index of win is 1 then
                    set winExists to true
                    exit repeat
                end if
            end repeat

            if not winExists then
                make new window
            else
                activate
            end if

            tell window 1
                set newTab to make new tab `+(e?`with properties {URL:"${e}"}`:t?'with properties {URL:"https://www.google.com/search?q='+t+'"}':"")+`
            end tell
        end tell
        return true

  `;break;case"profile_current":s=u(r);break;case"profile_original":s=u(n);break}return await P(s)}async function Ce(e){await P(`
    tell application "Google Chrome"
      activate
      set _wnd to first window where id is ${e.windowsId}
      set index of _wnd to 1
      set active tab index of _wnd to ${e.tabIndex}
    end tell
    return true
  `)}async function Ie(e){await P(`
    tell application "Google Chrome"
      activate
      set _wnd to first window where id is ${e.windowsId}
      set index of _wnd to 1
      set active tab index of _wnd to ${e.tabIndex}
      close active tab of _wnd
    end tell
    return true
  `)}async function Oe(e){await P(`
    tell application "Google Chrome"
      activate
      set _wnd to first window where id is ${e.windowsId}
      set index of _wnd to 1
      set active tab index of _wnd to ${e.tabIndex}
      tell active tab of _wnd to reload
    end tell
    return true
  `)}var ne=async()=>{if(await S.LocalStorage.getItem("is-installed"))return;if(await P(`
set isInstalled to false
try
    do shell script "osascript -e 'exists application \\"Google Chrome\\"'"
    set isInstalled to true
end try

return isInstalled`)==="false")throw new Error(j);S.LocalStorage.setItem("is-installed",!0)};var f=require("react/jsx-runtime"),D=class{static NewTab=ht;static TabList=pt;static TabHistory=mt};function ht({query:e,url:t}){let{openTabInProfile:r}=(0,c.getPreferenceValues)(),[n]=re(Q,V),a="Open Empty Tab";return e?a=`Search "${e}"`:t&&(a=`Open URL "${t}"`),(0,f.jsx)(c.ActionPanel,{title:"New Tab",children:(0,f.jsx)(c.Action,{onAction:()=>N({url:t,query:e,profileCurrent:n,openTabInProfile:r}),title:a})})}function pt({tab:e,onTabClosed:t}){return(0,f.jsxs)(c.ActionPanel,{title:e.title,children:[(0,f.jsx)(bt,{tab:e}),(0,f.jsx)(yt,{tab:e}),(0,f.jsx)(c.Action.CopyToClipboard,{title:"Copy URL",content:e.url}),(0,f.jsx)(c.Action.CopyToClipboard,{title:"Copy Title",content:e.title,shortcut:{modifiers:["cmd","shift"],key:"enter"}}),(0,f.jsx)(gt,{tab:e,onTabClosed:t}),(0,f.jsx)(c.ActionPanel.Section,{children:(0,f.jsx)(c.Action.CreateQuicklink,{quicklink:{link:e.url,name:e.title,application:"Google Chrome"},shortcut:{modifiers:["cmd"],key:"s"}})})]})}function mt({title:e,url:t,profile:r}){let{openTabInProfile:n}=(0,c.getPreferenceValues)(),[a]=re(Q,V);return(0,f.jsxs)(c.ActionPanel,{title:e,children:[(0,f.jsx)(c.Action,{onAction:()=>N({url:t,profileOriginal:r,profileCurrent:a,openTabInProfile:n}),title:"Open"}),(0,f.jsxs)(c.ActionPanel.Section,{title:"Open in profile",children:[(0,f.jsx)(c.Action,{onAction:()=>N({url:t,profileOriginal:r,profileCurrent:a,openTabInProfile:"profile_current"}),title:"Open in Current Profile"}),(0,f.jsx)(c.Action,{onAction:()=>N({url:t,profileOriginal:r,profileCurrent:a,openTabInProfile:"profile_original"}),title:"Open in Original Profile"})]}),(0,f.jsx)(c.Action.CopyToClipboard,{title:"Copy URL",content:t,shortcut:{modifiers:["cmd"],key:"c"}})]})}function bt(e){async function t(){try{await Ce(e.tab),await(0,c.closeMainWindow)()}catch(r){throw r instanceof Error?new Error("Issue with tab: '"+e.tab.sourceLine+`'
`+r.message):r}}return(0,f.jsx)(c.ActionPanel.Item,{title:"Open Tab",icon:{source:c.Icon.Eye},onAction:t})}function gt(e){async function t(){await Ie(e.tab),await(0,c.closeMainWindow)(),e.onTabClosed?.()}return(0,f.jsx)(c.Action,{title:"Close Tab",icon:{source:c.Icon.XMarkCircle},onAction:t,shortcut:{modifiers:["cmd","shift"],key:"w"}})}function yt(e){async function t(){try{await Oe(e.tab),await(0,c.closeMainWindow)()}catch(r){throw r instanceof Error?new Error("Issue with tab: '"+e.tab.sourceLine+`'
`+r.message):r}}return(0,f.jsx)(c.Action,{title:"Reload Tab",icon:{source:c.Icon.ArrowClockwise},onAction:t,shortcut:{modifiers:["cmd","shift"],key:"r"}})}var ae=require("@raycast/api");var M=require("react/jsx-runtime"),J=class{static TabList=wt;static TabHistory=$t};function $t({profile:e,entry:{url:t,title:r,id:n},type:a}){return(0,M.jsx)(ae.List.Item,{id:`${e}-${a}-${n}`,title:r,subtitle:t,icon:K(t),actions:(0,M.jsx)(D.TabHistory,{title:r,url:t,profile:e})})}function wt(e){return(0,M.jsx)(ae.List.Item,{title:e.tab.title,subtitle:e.tab.urlWithoutScheme(),keywords:[e.tab.urlWithoutScheme()],actions:(0,M.jsx)(D.TabList,{tab:e.tab,onTabClosed:e.onTabClosed}),icon:e.useOriginalFavicon?e.tab.realFavicon():e.tab.googleFavicon()})}var oe=require("react");var Ue=require("@raycast/api");var se=require("react/jsx-runtime");function Le(e=""){let{useOriginalFavicon:t}=(0,Ue.getPreferenceValues)(),[r,n]=(0,oe.useState)(),[a,s]=(0,oe.useState)(!1),{isLoading:u,data:d}=Pe((w,k)=>Re(w).then(p=>{let x=k.toLowerCase().split(/\s+/);return n(void 0),s(p.length===0),p.map(g=>[g,`${g.title.toLowerCase()} ${g.urlWithoutScheme().toLowerCase()}`]).filter(([,g])=>x.reduce((L,h)=>L&&g.includes(h),!0)).map(([g])=>g)}),[t,e],{onError(w){w.message===j?n((0,se.jsx)($e,{})):n((0,se.jsx)(we,{}))}});return{data:a?[]:d||[],isLoading:u,errorView:r}}var ie=require("react/jsx-runtime");function De(){let{useOriginalFavicon:e}=(0,Z.getPreferenceValues)(),[t,r]=(0,Ne.useState)(""),{data:n,errorView:a,isLoading:s}=Le(t);return a??(0,ie.jsx)(Z.List,{isLoading:s,onSearchTextChange:r,children:n.map(u=>(0,ie.jsx)(J.TabList,{tab:u,useOriginalFavicon:e},u.key()))})}
