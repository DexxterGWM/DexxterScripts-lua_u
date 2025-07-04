---@diagnostic disable: undefined-global, duplicate-set-field, deprecated, luadoc-miss-type-name

--- command pallet: ctrl + shift + p

---@TODO
---@TEST

---@VERSION
---@NOTUSED

--- loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/loader/Files%20Folder/ScriptBuild.lua';}).Body)()

--- TEST
--- loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/loader/Files%20Folder/Tests/ScriptBuild.lua';}).Body)()

--- SETTING NOT BEING USED

--[=[
--- NOTUSED

getgenv().checkcaller = checkcaller
--- checkcaller = rawget(getgenv(), 'checkcaller') or false;
]=]

-- START

--- warn(':: Dexxter :: !~ LOADER: warn for dumb people:'); print('if you see a "CLOWN FACE", IT\'S NOT MINE, BUT INSTEAD: YOUR EXECUTOR ISN\'T SUPPORTED. consider as to check the supported executors on my discord server.'); ---

-- SETTING

local getgenv = getgenv or syn_getgenv or (getfenv and function() return getfenv(2) end) or getrenv or function() return shared end

getgenv().cloneref = cloneref or function(...) return ... end

local Game = cloneref(Game)

local __old_script = script
local LoadTime = tick()

--- TEST
local _DEBUG = true

-- OTHER

do
        if not Game:IsLoaded() then
                local Loaded = Game.Loaded
                Loaded.Wait(Loaded)
        end
        repeat wait() until Game.Players and Game.Players.LocalPlayer and Game.Loaded
end

-- SETTING

local GetService = Game.GetService

local StarterGui = cloneref(GetService(Game, 'StarterGui'))
local VirtualUser = cloneref(GetService(Game, 'VirtualUser'))

local ExecutorsMissingFunctions = {
        Functions = ' ';
        Length = 0;
}
local LastExecutorsMissingFunctions = ExecutorsMissingFunctions.Length

-- SCRIPT LOCAL FUNCTION

---@param Function <string>
---@return <nil>
local __error_messageExecutorFunction = function()
        StarterGui:SetCore('SendNotification', {
                Title = 'script loader: error';
                Text = ('amount of missing/not found executor\'s functions: %s, check console.'):format(tostring(ExecutorsMissingFunctions.Length));
                Duration = math.huge;
                Button1 = 'Understood';
        })
end

-- SETTING

getgenv().hookmetamethod = hookmetamethod or hook_meta_method

getgenv().getrawmetatable = getrawmetatable or (debug and debug.getmetatable)
getgenv().hookfunction = hookfunc or replaceclosure or detour_function or hookfunction

getgenv().setreadonly = fullaccess or make_writeable or change_writeable or setreadonly or changereadonly
getgenv().makewriteable = makewriteable or (setreadonly and function(Table) setreadonly(Table, false) end)
getgenv().makereadonly = makereadonly or (setreadonly and function(Table) setreadonly(Table, true) end)

getgenv().setthreadidentity = setidentity or setthreadcontext or set_thread_identity or set_thread_context or (syn and syn.set_thread_identity) or setthreadidentity
getgenv().getgc = getgc or gc
getgenv().getrenv = getrenv or syn_getrenv or (syn and syn.getrenv) or getfenv
getgenv().getinfo = getinfo or (debug and (debug.getinfo or debug.info))
getgenv().newcclosure = newcclosure or (syn and syn.newcclosure) or syn_newcclosure

getgenv().getnamecallmethod = get_namecall_method or getnamecallmethod

--[=[
if not rawget(getgenv(), 'hookmetamethod') then
        if makewriteable and makereadonly then
                getgenv().hookmetamethod = function(Object, Metamethod, Function)
                        local Oldmetamethod = Object[Metamethod]

                        makewriteable(Object)
                        Object[Metamethod] = Function
                        makereadonly(Object)

                        return Oldmetamethod
                end

        elseif getrawmetatable and hookfunction then
                getgenv().hookmetamethod = function(Object, Metamethod, Function)
                        local ObjectMetatable = getrawmetatable(Object)
                        return hookfunction(ObjectMetatable[Metamethod], Function)
                end
        end
end
]=]

local CheckFunctionsTable = {
        --[=[
        { FunctionName = 'hookmetamethod';           Function = rawget(getgenv(), 'hookmetamethod')          or false; };
        { FunctionName = 'getrawmetatable';          Function = rawget(getgenv(), 'getrawmetatable')         or false; };
        { FunctionName = 'hookfunction';             Function = rawget(getgenv(), 'hookfunction')            or false; };
        { FunctionName = 'setreadonly';              Function = rawget(getgenv(), 'setreadonly')             or false; };
        ]=]
        { FunctionName = 'makewriteable';            Function = rawget(getgenv(), 'makewriteable')           or false; };
        { FunctionName = 'makereadonly';             Function = rawget(getgenv(), 'makereadonly')            or false; };
        --[=[
        { FunctionName = 'setthreadidentity';        Function = rawget(getgenv(), 'setthreadidentity')       or false; };
        { FunctionName = 'getgc';                    Function = rawget(getgenv(), 'getgc')                   or false; };
        { FunctionName = 'getrenv';                  Function = rawget(getgenv(), 'getrenv')                 or false; };
        { FunctionName = 'getinfo';                  Function = rawget(getgenv(), 'getinfo')                 or false; };
        ]=]
        { FunctionName = 'newcclosure';              Function = rawget(getgenv(), 'newcclosure')             or false; };
        --- { FunctionName = 'getnamecallmethod';        Function = rawget(getgenv(), 'getnamecallmethod')       or false; };
}

LastExecutorsMissingFunctions = ExecutorsMissingFunctions.Length

for i, v in next, CheckFunctionsTable do
        if 'function' ~= type(v.Function) then
                ExecutorsMissingFunctions.Length += 1
                ExecutorsMissingFunctions.Functions = ('%s\"%s\" '):format(ExecutorsMissingFunctions.Functions, v.FunctionName)
        end
end

if LastExecutorsMissingFunctions ~= ExecutorsMissingFunctions.Length then
        warn((':: Dexxter :: ?~ LOADER: aborting execution due to %s missing executor\'s functions detected: {%s}'):format(ExecutorsMissingFunctions.Length, ExecutorsMissingFunctions.Functions)) ---

        __error_messageExecutorFunction()
        ExecutorsMissingFunctions = {Functions = ' '; Length = 0;}
        
        return
end

local __index, __newindex

do
        local GameMetatable = (getrawmetatable and getrawmetatable(Game)) or {
                __index = function(self, Index) return self[Index] end;
                __newindex = function(self, Index, Value) self[Index] = Value end;
        }

        __index, __newindex = GameMetatable.__index, GameMetatable.__newindex
end

if 'table' ~= type(shared.__userStatus) then
        shared.__userStatus = {
                __autoExecuted = false;
                __functionStatus = {
                        _AntiAdonys = false; _AntiKick = false; _AntiAfk = false; --- TODO hookmethod thing
                };
        }
end

-- OTHER

do
        if not shared.__userStatus.__functionStatus._AntiAdonys and not shared.__userStatus.__functionStatus._AntiKick and not shared.__userStatus.__functionStatus._AntiAfk then
                if ((not Game:IsLoaded()) and (not Game.Workspace)) or 6 > Game.Workspace.DistributedGameTime then
                        if setthreadidentity and getgc and hookfunction and getrenv and getrenv().getinfo and newcclosure and hookmetamethod and getnamecallmethod then 
                                --- adonis bypass related
                                
                                --- loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/loader/Files%20Folder/Modules%20Folder/Module3.lua';}).Body)()
                                local a={}local b,c;setthreadidentity(2)for d,e in getgc(true)do if typeof(e)=='table'then local f=rawget(e,'Detected')local g=rawget(e,'Kill')if typeof(f)=='function'and not b then b=f;local h;h=hookfunction(b,function(i,j,k)if i~='_'then if DEBUG then warn(('Adonis AntiCheat flagged\nMethod: %s\nInfo: %s'):format(tostring(i),tostring(j)))end end;return true end)table.insert(a,b)end;if rawget(e,'Variables')and rawget(e,'Process')and typeof(g)=='function'and not c then c=g;local h;h=hookfunction(c,function(j)if DEBUG then warn(('Adonis AntiCheat tried to kill (fallback): %s'):format(tostring(j)))end end)table.insert(a,c)end end end;local h;h=hookfunction(getrenv().getinfo,newcclosure(function(...)local l,j=...if b and l==b then if DEBUG then warn('zins | adonis bypassed')end;return coroutine.yield(coroutine.running())end;return h(...)end))setthreadidentity(7)

                                --- anti kick related
                                
                                local Client = Game.Players.LocalPlayer
                                local OldIndex; OldIndex = hookmetamethod(Game, '__index', function(self, Method)
                                        if Client == self and 'kick' == Method:lower() then
                                                return error('Expected \':\' not \'.\' calling member function Kick', 2)
                                        end
                                        return OldIndex(self, Method)
                                end)
                                local OldNamecall; OldNamecall = hookmetamethod(Game, '__namecall', function(self, ...)
                                        if Client == self and 'kick' == getnamecallmethod():lower() then
                                                return
                                        end
                                        return OldNamecall(self, ...)
                                end)

                                --- TODO anti afk related
                                
                                shared.__userStatus.__functionStatus._AntiAdonys = true
                                shared.__userStatus.__functionStatus._AntiKick = true

                                --- shared.__userStatus.__functionStatus._AntiAfk = true
                                
                                shared.__userStatus.__autoExecuted = true
                        end
                else
                        Game.Players.LocalPlayer.Idled:Connect(function()
                                VirtualUser:CaptureController()
                                VirtualUser:ClickButton2(Vector2.new())
                        end)
                        
                        shared.__userStatus.__functionStatus._AntiAfk = true
                end
        end
end

-- SETTING

getgenv().setfenv = setfenv --- TODO
getgenv().iscclosure = is_c_closure or (syn and syn.iscclosure) or syn_iscclosure or is_cclosure or iscclosure
getgenv().islclosure = is_l_closure or (syn and syn.islclosure) or syn_islclosure or is_lclosure or isluaclosure or islclosure

getgenv().request = httprequest or request or http_request or httpget or (http and http.request) or (syn and syn.request) or (fluxus and fluxus.request)

local CheckFunctionsTable = {
        { FunctionName = 'setfenv';              Function = rawget(getgenv(), 'setfenv')         or false; };
        { FunctionName = 'islclosure';           Function = rawget(getgenv(), 'islclosure')      or false; };
        { FunctionName = 'iscclosure';           Function = rawget(getgenv(), 'iscclosure')      or false; };
        { FunctionName = 'request';              Function = rawget(getgenv(), 'request')         or false; };
}

LastExecutorsMissingFunctions = ExecutorsMissingFunctions.Length

for i, v in next, CheckFunctionsTable do
        if 'function' ~= type(v.Function) then
                ExecutorsMissingFunctions.Length += 1
                ExecutorsMissingFunctions.Functions = ('%s\"%s\" '):format(ExecutorsMissingFunctions.Functions, v.FunctionName)
        end
end

if LastExecutorsMissingFunctions ~= ExecutorsMissingFunctions.Length then
        warn((':: Dexxter :: ?~ LOADER: aborting execution due to %s missing executor\'s functions detected: {%s}'):format(ExecutorsMissingFunctions.Length, ExecutorsMissingFunctions.Functions)) ---
        
        __error_messageExecutorFunction()
        ExecutorsMissingFunctions = {Functions = ' '; Length = 0;}
        
        return
end

-- OTHER

do
        --- check part 1

        if not iscclosure(getgenv().setfenv) or not iscclosure(getgenv().tostring) or not iscclosure(getgenv().tonumber) then
                while true do end; return
        elseif islclosure(getgenv().setfenv) or islclosure(getgenv().tostring) or islclosure(getgenv().tonumber) then
                while true do end; return
        end

        if not iscclosure(string.find) or not iscclosure(string.match) or not iscclosure(string.gmatch) or not iscclosure(string.char) or not iscclosure(string.reverse) then
                while true do end; return
        elseif islclosure(string.find) or islclosure(string.match) or islclosure(string.gmatch) or islclosure(string.char) or islclosure(string.reverse) then
                while true do end; return
        end
end

--- /
--[=[
do
        --- check part 2

        --- TODO __loaderScriptLoaded in case it's needed

        if nil ~= shared.__loaderScriptLoaded then
                for i, v in next, shared.__loaderScriptLoaded do
                        v(); table.remove(shared.__loaderScriptLoaded, i)
                end
        else
                shared.__loaderScriptLoaded = {}
        end
end
]=]
--- /

-- SETTING

-- OTHER

local ExecutorSupportsOrNot
do
        --- check

        local TestObj = { _S = 'TEST'; }
        makereadonly(TestObj); setreadonly(TestObj, true)

        if not isreadonly(TestObj) then
                table.freeze(TestObj)
                local _S, _R = pcall(function()
                        TestObj._S = 'test'
                end)
                if _S then while true do end; return end
                ExecutorSupportsOrNot = falseExecutorSupportsOrNot

        elseif isreadonly(TestObj) then
                local Old = clonefunction(getgenv().string.find)

                local _S, _R = pcall(function()
                        makewriteable(getgenv().string); setreadonly(getgenv().string, false)

                        string.find = newcclosure(function(...) return Old(...) end)
                        return string.find == Old
                end)

                if (not _S) and (not 'string' == type(_R) or not Old(_R, 'attempt to modify')) then
                        while true do end; return
                end
                
                if not _S and Old(_R, 'attempt to modify') then
                        ExecutorSupportsOrNot = false
                elseif _S and _R then
                        while true do end; return
                elseif _S and not _R then
                        string.find = Old
                        ExecutorSupportsOrNot = true

                        makereadonly(string); setreadonly(string, true)
                end
        end
end

do
        --- unload variables settings

        if shared.__varStore1 then
                pcall(hookfunction, string.find, shared.__varStore1)
        end
        if shared.__varStore2 then
                pcall(hookfunction, string.match, shared.__varStore2)
        end
        if shared.__varStore3 then
                pcall(hookfunction, string.gmatch, shared.__varStore3)
        end
        if shared.__varStore4 then
                pcall(hookfunction, string.char, shared.__varStore4)
        end
        if shared.__varStore5 then
                pcall(hookfunction, string.reverse, shared.__varStore5)
        end
        if shared.__varStore6 then
                pcall(hookfunction, string.split, shared.__varStore6)
        end
        if shared.__varStore7 then
                pcall(hookfunction, string.gsub, shared.__varStore7)
        end
        if shared.__varStore8 then
                pcall(hookfunction, string.sub, shared.__varStore8)
        end
        if shared.__varStore9 then
                pcall(hookfunction, request, shared.__varStore9)
        end
end

-- SETTING

shared.__userKey = {__key = nil; __type = nil;}

getgenv().cloneref = cloneref or function(...) return ... end
getgenv().clonefunction = clonefunction or clonefunc or function(...) return ... end

getgenv().identifyexecutor = identifyexecutor or getexecutorname or function() return 'Unknown' end

getgenv().isfolder = syn_isfolder or is_folder or isfolder
getgenv().isfile = syn_isfile or is_file or isfile
getgenv().readfile = read or readfile
getgenv().makefolder = create_folder or make_folder or createfolder or makefolder
getgenv().writefile = write or write_file or writefile
getgenv().setclipboard = (Clipboard and Clipboard.set) or set_clipboard or syn_clipboard_set or setrbxclipboard or writeclipboard or toclipboard or setclipboard

local CheckFunctionsTable = {
        { FunctionName = 'isfolder';             Function = rawget(getgenv(), 'isfolder')        or false };
        { FunctionName = 'isfile';               Function = rawget(getgenv(), 'isfile')          or false };
        { FunctionName = 'readfile';             Function = rawget(getgenv(), 'readfile')        or false };
        { FunctionName = 'makefolder';           Function = rawget(getgenv(), 'makefolder')      or false };
        { FunctionName = 'writefile';            Function = rawget(getgenv(), 'writefile')       or false };
        { FunctionName = 'setclipboard';         Function = rawget(getgenv(), 'setclipboard')    or false };
}

LastExecutorsMissingFunctions = ExecutorsMissingFunctions.Length

for i, v in next, CheckFunctionsTable do
        if 'function' ~= type(v.Function) then
                ExecutorsMissingFunctions.Length += 1
                ExecutorsMissingFunctions.Functions = ('%s\"%s\" '):format(ExecutorsMissingFunctions.Functions, v.FunctionName)
        end
end

if LastExecutorsMissingFunctions ~= ExecutorsMissingFunctions.Length then
        warn((':: Dexxter :: ?~ LOADER: aborting execution due to %s missing executor\'s functions detected: {%s}'):format(ExecutorsMissingFunctions.Length, ExecutorsMissingFunctions.Functions)) ---
        
        __error_messageExecutorFunction()
        ExecutorsMissingFunctions = {Functions = ' '; Length = 0;}
        
        return
end

local UserInputService = cloneref(GetService(Game, 'UserInputService'))
local MarketplaceService = cloneref(GetService(Game, 'MarketplaceService'))
local RbxAnalyticsService = cloneref(GetService(Game, 'RbxAnalyticsService'))
local HttpService = cloneref(GetService(Game, 'HttpService'))
local Players = cloneref(GetService(Game, 'Players'))

local Client = Players.LocalPlayer
local GameId = __index(Game, 'PlaceId')

--- local Tostring = clonefunction(tostring)
--- local Tonumber = clonefunction(tonumber)

-- SCRIPT LOCAL FUNCTION

---@param Length <number>
---@return <string>
local __random_abcE = function(Length)
        local RandomString = ''
        for _ = 1, Length do
                local RandomNumber = math.random(97, 122)
                RandomString = RandomString .. string.char(RandomNumber)
        end
        --- return tostring(RandomString)
        return RandomString
end

---@param Length <number>
---@return <string>
local __random_abcE2 = function(Length)
        local RandomAlphaNumericString = ''
        for _ = 1, Length do
                local CharType = math.random(1, 2)
                local RandomNumberChar
                if 1 == CharType then
                        RandomNumberChar = string.char(math.random(48, 57))
                else
                        RandomNumberChar = string.char(math.random(97, 122))
                end
                --- RandomAlphaNumericString = RandomAlphaNumericString .. tostring(RandomNumberChar)
                RandomAlphaNumericString = RandomAlphaNumericString .. RandomNumberChar
        end
        return RandomAlphaNumericString
end

---@param Length <number>
---@return <string>
local __random_abcE3 = function(Length)
        local SpecialCharacterRange = {
                {33, 47}, {58, 64}, {91, 96}, {123, 126},
        }
        local RandomSpecialString = ''
        for i = 1, Length do
                local Range = SpecialCharacterRange[math.random(1, #SpecialCharacterRange)]
                local RandomSpecialChar = string.char(math.random(Range[1], Range[2]))
                RandomSpecialString = RandomSpecialString .. RandomSpecialChar
        end
        return RandomSpecialString
end

local __error_message = function()
        local BindableFunction = Instance.new('BindableFunction')
        BindableFunction.OnInvoke = function(Text)
                if 'yes' == Text then StarterGui:SetCore('DevConsoleVisible', true) end
        end
        StarterGui:SetCore('SendNotification', {
                Title = 'script loader: error';
                Text = 'an error occured, open /console?';
                Duration = math.huge;
                Callback = BindableFunction;
                Button1 = 'yes';
                Button2 = 'no';
        })
end

local GetPlatform = function()
        local Platform = 'Unknown'
        local Device = 'Unknown Device'
        
        if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
                Platform = 'Mobile'
                Device = 'Mobile Device'
                if UserInputService.AccelerometerEnabled then
                        Device = 'Smartphone/Tablet'
                end
        elseif UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
                Platform = 'Desktop'
                Device = 'PC/Laptop'
        end
        
        return Platform, Device
end

-- MODULE AND DATA

--- local _LOCALCRYPT
local _LOCALCRYPT = {}
do
        --- encryption module

        if _DEBUG then
                print(':: Dexxter :: !~ LOADER: requesting <module> 1..')
        end

        local OldPrint
        if ExecutorSupportsOrNot then
                OldPrint = clonefunction(print)
        else
                OldPrint = getgenv().print
        end

        if hookfunction then
                hookfunction(print, newcclosure(function() end)); task.wait()
        end
        if (not hookfunction) or getgenv().print == OldPrint then
                getgenv().print = newcclosure(function() end)
        end

        local _S; _S, Result = xpcall(function()
                return loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/loader/Files%20Folder/Modules%20Folder/Module1.lua';}).Body)()

                --- TEST
                --- return loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/loader/Files%20Folder/Tests/Module1.lua';}).Body)()
        end, function(Err)
                warn(':: Dexxter :: ?~ LOADER: ERROR: failed while requesting <module> 1:', Err)
        end); task.wait(.1)

        if hookfunction then
                hookfunction(print, OldPrint); task.wait()
        end
        if (not hookfunction) or getgenv().print ~= OldPrint then
                getgenv().print = OldPrint
        end

        if _S and 'table' == type(Result) then
                if _DEBUG then
                        print(':: Dexxter :: !~ LOADER: <module> 1 requested.') ---
                end
        else
                warn(':: Dexxter :: ?~ LOADER: ERROR: failed while receiving <module> 1.') ---

                return
        end
        
        if _DEBUG then
                print(':: Dexxter :: !~ LOADER: checking <module> 1..') ---
        end

        if Result.encrypt and Result.decrypt and Result.hash then
        else
                while true do end; return
        end

        --- TODO sanity check from these functions
        _LOCALCRYPT = Result

        if _DEBUG then
                print(':: Dexxter :: !~ LOADER: <module> 1 checked.')
        end
end

do
        --- check place id

        if _DEBUG then
                print(':: Dexxter :: !~ LOADER: DATA: requesting <data> 1..') ---
        end

        local _S, Result = xpcall(function()
                --- return request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/scripts/Files%20Folder/Scripts%20List/ScriptsList.json'; Method = 'GET';}).Body
                local Result = request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/scripts/Files%20Folder/Scripts%20List/ScriptsList.json'; Method = 'GET';}).Body

                local _, Result = pcall(HttpService.JSONDecode, HttpService, Result)
                return Result
        end, function(Err)
                warn(':: Dexxter :: ?~ LOADER: DATA: ERROR: failed while requesting <data> 1:', Err) ---
        end)

        if _S and 'table' == type(Result)then
                if _DEBUG then
                        print(':: Dexxter :: !~ LOADER: DATA: <data> 1 requested.') ---
                end
        else
                warn(':: Dexxter :: ?~ LOADER: DATA: ERROR: error while receiving <data> 1.') ---
                return
        end

        if _DEBUG then
                print(':: Dexxter :: !~ LOADER: DATA: checking <data> 1.. ') ---
        end

        if 'table' == type(Result.PlacesIds) then
        else
                warn(':: Dexxter :: ?~ LOADER: DATA: ERROR: error while checking <data> 1.') ---
                return
        end

        do
                if Result.PlacesIds[tostring(Game.PlaceId)] then
                else
                        StarterGui:SetCore('SendNotification', {
                                Title = 'script loader',
                                Text = '`game` not supported :( - give a suggestion on my discord server!',
                                Duration = 7
                        })
                        warn(':: Dexxter :: !~ LOADER: DATA: `game` not supported :( - give a suggestion on my discord server!') ---
                        return
                end
        end

        if _DEBUG then
                print(':: Dexxter :: !~ LOADER: DATA: <data> 1 checked.') ---
        end
end

do
        --- script informations

        local LoaderInformations
        do
                if _DEBUG then
                        print(':: Dexxter :: ?~ LOADER: DATA: requesting <data> 2..') ---
                end

                local _S, Result = xpcall(function()
                        --- return request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/loader/Files%20Folder/Loader%20Status/Informations.json'; Method = 'GET';}).Body
                        local Result = request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/loader/Files%20Folder/Loader%20Status/Informations.json'; Method = 'GET';}).Body

                        local _, Result = pcall(HttpService.JSONDecode, HttpService, Result)
                        return Result
                end, function(Err)
                        warn(':: Dexxter :: ?~ LOADER: DATA: ERROR: failed while requesting <data> 2:', Err) ---
                end)

                if _S and 'table' == type(Result) then
                        if _DEBUG then
                                print(':: Dexxter :: !~ LOADER: DATA: <data> 2 requested.') ---
                        end
                else
                        warn(':: Dexxter :: ?~ LOADER: DATA: ERROR: <data> 2 request failed.') ---
                        return
                end

                LoaderInformations = Result
        end

        if _DEBUG then
                print(':: Dexxter :: !~ LOADER: DATA: checking <data> 2..') ---
        end

        if 'string' == type(LoaderInformations.Status) and 'string' == type(LoaderInformations.Version) and 'string' == type(LoaderInformations.UpdateDate) then
        else
                warn(':: Dexxter :: ?~ LOADER: DATA: error while checking <data> 2.') ---
                return
        end

        do
                --- VERSION
                local Version = '2Az.Y^e-7' --- TODO need to change
                
                local h = _LOCALCRYPT.hash('_SIGNED' .. Version)
                local u = _LOCALCRYPT.encrypt(h, '_SIGNED')
                if _LOCALCRYPT.hash('_SIGNED' .. LoaderInformations.Version) ~= h then
                        while true do end; return
                elseif _LOCALCRYPT.encrypt(_LOCALCRYPT.hash('_SIGNED' .. LoaderInformations.Version), '_SIGNED') ~= u then
                        while true do end; return
                end
        end

        if _DEBUG then
                print(':: Dexxter :: !~ LOADER: DATA: <data> 2 checked.') ---
        end

        warn(':: Dexxter :: !~ LOADER: status:') ---
        print(('\tlast update date : %s (MM/DD/YYYY)'):format(LoaderInformations.UpdateDate)) ---
        print(('\tloader service status : %s'):format(LoaderInformations.Status)) ---

        warn(':: Dexxter :: !~ LOADER: client status:') ---
        print(('\tscript auto executed : %s'):format((shared.__userStatus.__autoExecuted and 'yes') or 'not')) ---
        print(('\tanti kick loaded : %s'):format(tostring((shared.__userStatus.__functionStatus._AntiKick and 'yes') or 'not'))) ---
        print(('\tanti afk loaded : %s'):format(tostring((shared.__userStatus.__functionStatus._AntiAfk and 'yes') or 'not'))) ---
end

--- pelican module
local _PELICAN = {}
do
        if _DEBUG then
                warn(':: Dexxter :: ?~ LOADER: start building module..') ---
                warn(':: Dexxter :: ?~ LOADER: requesting <module> 2..') ---
        end

        local OldWarn
        if ExecutorSupportsOrNot then
                OldWarn = clonefunction(getgenv().warn)
        else
                OldWarn = getgenv().warn
        end
        if hookfunction then
                hookfunction(getgenv().warn, newcclosure(function() end)); task.wait()
        end
        if (not hookfunction) or getgenv().warn == OldWarn then
                getgenv().warn = newcclosure(function() end)
        end

        local _S, Pelican = pcall(function()
                return loadstring(request({Url = 'https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/refs/heads/main/library/LuaLib/ROBLOX/PandaSVALLib.lua';}).Body)()
        end)

        if _S and 'table' == type(Pelican) then
        else
                if hookfunction then
                        hookfunction(getgenv().warn, OldWarn); task.wait()
                end
                if (not hookfunction) or getgenv().warn ~= OldWarn then
                        getgenv().warn = OldWarn
                end

                warn(':: Dexxter :: LOADER: ERROR: ?~ <module> 2 request failed.') ---
                return
        end

        if Pelican.Get_DisplayName and Pelican.Get_DiscordInvitation and Pelican.Initialize and Pelican.ValidateKey and Pelican.Get_Version and Pelican.GetKey and Pelican.Get_LogoImages then
        else
                while true do end; return
        end

        _PELICAN.serviceIdentifier = 'dexxterhub'
        _PELICAN.success = nil
        _PELICAN.started = false
        _PELICAN.random = __random_abcE(math.random(1, 20))
        _PELICAN.random2 = __random_abcE2(math.random(1, 20))
        _PELICAN.key = nil
        _PELICAN.keyType = nil
        _PELICAN.lastResponse = nil

        Pelican:Initialize({ 
                Service = 'dexxterhub';
                API_Key = 'd97fcc28458ee0d928963103be9ee7c718d8da9e613ce381933b72459bd6e997';
                DisplayName = 'Dexxter Script HUB';
                IsDebug = false;
                Allow_BlacklistUsers = false;
                GUIVersion = false;
                EnableWebhook = true;
                --- Webhook_URL = '';
                --- Authenticated = function() end;
                --- NotAuthenticated = function() end;
        })

        if hookfunction then
                hookfunction(getgenv().warn, OldWarn); task.wait()
        end
        if (not hookfunction) or getgenv().warn ~= OldWarn then
                getgenv().warn = OldWarn
        end

        if _DEBUG then warn(':: Dexxter :: LOADER: !~ <module> 2 loaded.') end

        do
                --- key link related functions
                
                local l = function()
                        local _S, _R = xpcall(function()
                                local Link = Pelican.GetKey()
                                return Link
                        end, function(Err)
                                warn(':: Dexxter :: ?~ LOADER: error requesting <key> link: ' .. tostring(Err)) ---
                        end)
                        if _S and 'string' == type(_R) then return _R end
                end

                _PELICAN.l = function() return select(2, pcall(l)) end

                --- client hwid related functions

                local h = function()
                        if gethwid then return gethwid() end
                        local _S, _R = xpcall(function()
                                return request({
                                        Url = 'http://httpbin.org/get';
                                        Method = 'GET';
                                        --- Headers = {['Content-Type'] = 'application/json';};
                                })
                        end, function(Err)
                                warn(':: Dexxter :: ?~ LOADER: error while getting client: ' .. tostring(Err)) ---
                        end)
                        if (_S and _R) and _R.Body then
                                local Result = select(2, xpcall(function()
                                        return HttpService:JSONDecode(_R.Body)
                                end, function(Err)
                                        warn(':: Dexxter :: ?~ LOADER: error while verifying client: ' .. tostring(Err)) ---
                                end))

                                if 'table' == type(Result) then
                                        local Headers = Result.headers or Result.Headers
                                        for i, v in next, Headers do
                                                for _, v2 in next, {'fingerprint', 'guid', 'hwid', 'ios'} do
                                                        if string.find(string.lower(i), v2) then return v end
                                                end
                                        end
                                end
                        end
                        return ('table' == type(_R) and tostring(select(2, pcall(HttpService.JSONEncode, HttpService, _R)))) or tostring(_R)
                end

                _PELICAN.h = function() return select(2, pcall(h)) end
        end

        do
                --- user key

                ---@param Debug <boolean>
                ---@return <table, false>
                _PELICAN.vK = function(Debug)
                        local _, _R = xpcall(function()
                                local OldWarn, OldPrint
                                if ExecutorSupportsOrNot then
                                        OldWarn, OldPrint = clonefunction(warn), clonefunction(print)
                                else
                                        OldWarn, OldPrint = warn, print
                                end

                                if true == _PELICAN.success and false == _PELICAN.started then
                                        if 'string' == type(_PELICAN.key) and string.match(_PELICAN.key, '^DEXXTER%-KEY_(%w+)$') then
                                                _PELICAN.started = true

                                                warn(':: Dexxter :: !~ LOADER: checking <client>\'s key..')

                                                if hookfunction then
                                                        hookfunction(warn, newcclosure(function() end)); hookfunction(print, newcclosure(function() end)); task.wait()
                                                end
                                                if (not hookfunction) or getgenv().warn == OldWarn then getgenv().warn = newcclosure(function() end) end
                                                if (not hookfunction) or getgenv().print == OldPrint then getgenv().print = newcclosure(function() end) end

                                                --- random key check 1

                                                local SizesTable = {9; 12;}
                                                local RandomSize = SizesTable[math.random(1, #SizesTable)]

                                                local SizesTable2 = {10; 25;}
                                                local RandomSize2 = SizesTable[math.random(1, #SizesTable2)]

                                                local Result, Result2 = __random_abcE(RandomSize), __random_abcE2(RandomSize2)

                                                if _PELICAN.random ~= Result and _PELICAN.random2 ~= Result2 then
                                                else
                                                        while true do end; return
                                                end
                                                _PELICAN.random, _PELICAN.random2 = Result, Result2
                                                
                                                local Response = select(2, pcall(Pelican.ValidateKey, Pelican, ('DEXXTER-KEY_%s'):format(__random_abcE2(25))))
                                                if Response then
                                                        _PELICAN = {}; _LOCALCRYPT = {}
                                                        while true do end; return
                                                end

                                                --- key type check
                                                local h = _LOCALCRYPT.hash('_SIGNED' .. _PELICAN.key)
                                                local u = _LOCALCRYPT.encrypt(h, '_SIGNED')
                                                if _LOCALCRYPT.hash('_SIGNED' .. _PELICAN.key) == h and _LOCALCRYPT.encrypt(_LOCALCRYPT.hash('_SIGNED' .. _PELICAN.key), '_SIGNED') == u then
                                                else
                                                        _PELICAN = {}; _LOCALCRYPT = {}
                                                        while true do end; return
                                                end

                                                --- random key check 2
                                                local Url = ('https://pandadevelopment.net/v2_validation?hwid=%s&service=%s&key=%s'):format(
                                                        tostring(Client.UserId),
                                                        _PELICAN.serviceIdentifier,
                                                        ('DEXXTER-KEY_%s'):format(__random_abcE2(25))
                                                )
                                                local Result = request({ Url = Url; Method = 'GET'; })
                                                
                                                if Result.Success or 200 == Result.StatusCode or (Result.StatusMessage and 'OK' == Result.StatusMessage) then
                                                        local Result = select(2, pcall(HttpService.JSONDecode, HttpService, Result.Body))

                                                        if 'table' == type(Result) and 'success' == Result['V2_Authentication'] then
                                                                if Result['Key_Information']['Premium_Mode'] then
                                                                        _PELICAN = {}; _LOCALCRYPT = {}
                                                                        while true do end; return
                                                                end
                                                                _PELICAN = {}; _LOCALCRYPT = {}
                                                                while true do end; return
                                                        end

                                                        --- check key
                                                        local Response = select(2, pcall(Pelican.ValidateKey, Pelican, _PELICAN.key))

                                                        if Response then
                                                                if string.match(_PELICAN.key, '^DEXXTER%-KEY_(%w+)$') then
                                                                else
                                                                        _PELICAN = {}; _LOCALCRYPT = {}
                                                                        while true do end; return
                                                                end

                                                                if string.match(('%s-KEY_%s'):format(__random_abcE(7), __random_abcE2(10)), '^DEXXTER%-KEY_(%w+)$') then
                                                                        _PELICAN = {}; _LOCALCRYPT = {}
                                                                        while true do end; return
                                                                end

                                                                --- success
                                                                shared.__userKey.__key = _PELICAN.key
                                                                _PELICAN.keyType = '__is_freeKey'

                                                                local KeyTypeInfo, KeyTypeInfo3 = '_IsFreeKey7', '_FreeKey'

                                                                local Url = ('https://pandadevelopment.net/v2_validation?hwid=%s&service=%s&key=%s'):format(
                                                                        tostring(Client.UserId),
                                                                        _PELICAN.serviceIdentifier,
                                                                        _PELICAN.key
                                                                )
                                                                local Result = request({ Url = Url; Method = 'GET'; })

                                                                if hookfunction then
                                                                        hookfunction(warn, OldWarn); hookfunction(print, OldPrint); task.wait()
                                                                end
                                                                if (not hookfunction) or getgenv().warn ~= OldWarn then getgenv().warn = OldWarn end
                                                                if (not hookfunction) or getgenv().print ~= OldPrint then getgenv().print = OldPrint end
                                                                
                                                                if Result.Success or 200 == Result.StatusCode or (Result.StatusMessage and 'OK' == Result.StatusMessage) then
                                                                        local Result = select(2, pcall(HttpService.JSONDecode, HttpService, Result.Body))

                                                                        if 'table' == type(Result) and 'success' == Result['V2_Authentication'] then
                                                                                if Result['Key_Information']['Premium_Mode'] then
                                                                                        _PELICAN.keyType = '__is_premiumKey'
                                                                                        KeyTypeInfo, KeyTypeInfo3 = '_IsPremiumKey7', '_PremiumKey'
                                                                                end
                                                                        end

                                                                        shared.__userKey.__type = KeyTypeInfo
                                                                        writefile('Dexxter Scripts HUB/' .. tostring(Client.UserId) .. '.json',
                                                                                HttpService:JSONEncode( {__userKey = {__key = _PELICAN.key; __type = KeyTypeInfo3;};} )
                                                                        )
                                                                        
                                                                        StarterGui:SetCore('SendNotification', {
                                                                                Title = 'script loader'; Text = '<client> successfully whitelisted, loading script..'; Duration = 7;
                                                                        })

                                                                        task.spawn(function()
                                                                                xpcall(function()
                                                                                        loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/scripts/Files%20Folder/' .. tostring(Game.PlaceId) .. '.lua';}).Body)()

                                                                                        --- TEST
                                                                                        --- loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/DexxterScripts-lua_u/scripts/Files%20Folder/Tests/' .. tostring(Game.PlaceId) .. '.lua';}).Body)()
                                                                                end, function(Err)
                                                                                        warn(':: Dexxter :: ?~ LOADER: ERROR: failed while requesting game script:', Err) ---
                                                                                end)
                                                                        end)
                                                                        
                                                                        if '__is_premiumKey' == _PELICAN.keyType then
                                                                                warn(':: Dexxter :: !~ LOADER: <client> successfully whitelisted with premium plan.') ---
                                                                        else
                                                                                warn(':: Dexxter :: !~ LOADER: <client> successfully whitelisted with free plan.') ---
                                                                        end
                                                                        
                                                                        _PELICAN.success, _PELICAN.started = nil, false
                                                                        
                                                                        _PELICAN.lastResponse = {__loader_tableResult = { _Success = '__true'; _Type = _PELICAN.keyType; _Key = _PELICAN.key; } }
                                                                        return _PELICAN.lastResponse
                                                                else
                                                                        warn(':: Dexxter :: ?~ LOADER: error verifying <client>\'s key [2]') ---
                                                                        task.spawn(__error_message)
                                                                end
                                                        else
                                                                if hookfunction then
                                                                        hookfunction(warn, OldWarn); hookfunction(print, OldPrint); task.wait()
                                                                end
                                                                if (not hookfunction) or getgenv().warn ~= OldWarn then getgenv().warn = OldWarn end
                                                                if (not hookfunction) or getgenv().print ~= OldPrint then getgenv().print = OldPrint end

                                                                print(Response)
                                                                
                                                                warn(':: Dexxter :: ?~ LOADER: <client>\'s key isn\'t valid.') ---
                                                                task.spawn(__error_message)
                                                        end
                                                else
                                                        if hookfunction then
                                                                hookfunction(warn, OldWarn); hookfunction(print, OldPrint); task.wait()
                                                        end
                                                        if (not hookfunction) or getgenv().warn ~= OldWarn then getgenv().warn = OldWarn end
                                                        if (not hookfunction) or getgenv().print ~= OldPrint then getgenv().print = OldPrint end

                                                        table.foreach(Result, function(i, v)
                                                                warn(i, ':', v)
                                                        end)
                                                        
                                                        warn(':: Dexxter :: ?~ LOADER: error verifying <client>\'s key [1]') ---
                                                        task.spawn(__error_message)
                                                end
                                        end
                                end

                                if hookfunction then
                                        hookfunction(warn, OldWarn); hookfunction(print, OldPrint); task.wait()
                                end
                                if (not hookfunction) or getgenv().warn ~= OldWarn then getgenv().warn = OldWarn end
                                if (not hookfunction) or getgenv().print ~= OldPrint then getgenv().print = OldPrint end

                                _PELICAN.started = false
                                return false
                        end, warn) --- TEST
                        return _R
                end
        end

        --- handle key verification

        ---@param Key <string>
        ---@param Debug <boolean>
        ---@return <table, boolean>
        _PELICAN.t = function(Key, Debug)
                local _, _R = xpcall(function()
                        warn('[2]', Key, ';', Debug) --- TEST
                        print(_PELICAN.started, '|', _PELICAN.success) --- TEST

                        if 'string' == type(Key) and
                                string.match(Key, '^DEXXTER%-KEY_(%w+)$')
                                and not _PELICAN.started
                        then
                                warn('here') --- TEST

                                local h = _LOCALCRYPT.hash('_SIGNED' .. Key)
                                local u = _LOCALCRYPT.encrypt(h, '_SIGNED')
                                if _LOCALCRYPT.hash('_SIGNED' .. Key) == h and _LOCALCRYPT.encrypt(_LOCALCRYPT.hash('_SIGNED' .. Key), '_SIGNED') == u then
                                        _PELICAN.success = true
                                        _PELICAN.key = Key
                                        if not isfolder('Dexxter Scripts HUB') then
                                                makefolder('Dexxter Scripts HUB')
                                        end
                                        warn('abc') --- TEST

                                        return _PELICAN.vK(Debug)
                                end
                        end
                        _PELICAN.success = false
                        return false
                end, warn) --- TEST
                return _R
        end

        if _DEBUG then warn(':: Dexxter :: !~ LOADER: building module ended.') end
end

do
        --- check key from file
        if isfolder('Dexxter Scripts HUB') and isfile('Dexxter Scripts HUB/' .. tostring(Client.UserId) .. '.json') then
                local _S, Data = pcall(function()
                        return HttpService:JSONDecode(readfile(('Dexxter Scripts HUB/%s.json'):format(tostring(Client.UserId))))
                end)
                
                if (_S and 'table' == type(Data) and 'table' == type(Data.__userKey)) and Data.__userKey.__key and Data.__userKey.__type then
                        local Key = Data.__userKey.__key
                        local Type = Data.__userKey.__type

                        if 'string' == type(Key) and 'string' == type(Type) and (('_FreeKey' == Type) or ('_PremiumKey' == Type)) then
                                getgenv().warn(':: Dexxter :: !~ LOADER: automatically trying to login with <client>\'s stored key..') ---

                                --- free key
                                if '_FreeKey' == Type then
                                        local Response = _PELICAN.t(Key, false)

                                        if 'table' == type(Response) and 'table' == type(_PELICAN.lastResponse) then
                                                if 'table' == type(Response.__loader_tableResult) and 'table' == type(_PELICAN.lastResponse.__loader_tableResult) then
                                                        if '__true' == Response.__loader_tableResult._Success
                                                                and '__is_freeKey' == Response.__loader_tableResult._Type
                                                                and string.match(Response.__loader_tableResult._Key, '^DEXXTER%-KEY_(%w+)$')
                                                        then
                                                                if _PELICAN.lastResponse.__loader_tableResult._Success == Response.__loader_tableResult._Success
                                                                        and _PELICAN.lastResponse.__loader_tableResult._Type == Response.__loader_tableResult._Type
                                                                        and _PELICAN.lastResponse.__loader_tableResult._Key == Response.__loader_tableResult._Key
                                                                then
                                                                        warn(':: Dexxter :: !~ LOADER: <client>\'s free key stored is valid..') ---
                                                                        warn((':: Dexxter :: !~ LOADER: loader script loaded in : %.4f second(s)'):format(tick() - LoadTime)) ---
                                                                        return
                                                                else
                                                                        while true do end; return
                                                                end
                                                        else
                                                                while true do end; return
                                                        end
                                                else
                                                        while true do end; return
                                                end
                                        end

                                --- premium key
                                elseif '_PremiumKey' == Type then
                                        local Response = _PELICAN.t(Key, false) 

                                        if 'table' == type(Response) and 'table' == type(_PELICAN.lastResponse) then
                                                if 'table' == type(Response.__loader_tableResult) and 'table' == type(_PELICAN.lastResponse.__loader_tableResult) then
                                                        if '__true' == Response.__loader_tableResult._Success
                                                                and '__is_premiumKey' == Response.__loader_tableResult._Type
                                                                and string.match(Response.__loader_tableResult._Key, '^DEXXTER%-KEY_(%w+)$')
                                                        then
                                                                if _PELICAN.lastResponse.__loader_tableResult._Success == Response.__loader_tableResult._Success
                                                                        and _PELICAN.lastResponse.__loader_tableResult._Type == Response.__loader_tableResult._Type
                                                                        and _PELICAN.lastResponse.__loader_tableResult._Key == Response.__loader_tableResult._Key
                                                                then
                                                                        warn(':: Dexxter :: !~ LOADER: <client>\'s premium key stored is valid..') ---
                                                                        warn((':: Dexxter :: !~ LOADER: loader script loaded in : %.4f second(s)'):format(tick() - LoadTime)) ---
                                                                        return
                                                                else
                                                                        while true do end; return
                                                                end
                                                        else
                                                                while true do end; return
                                                        end
                                                else
                                                        while true do end; return
                                                end
                                        end
                                end

                                getgenv().warn(':: Dexxter :: ?~ LOADER: <client>\'s key stored isn\'t valid.') ---
                        end
                end
        end
end

local GuiLibrary
local LoginSection, InfoDiscordSection

do
        if _DEBUG then warn(':: Dexxter :: ?~ LOADER: requesting <module> 3..') end

        local _S; _S, GuiLibrary = xpcall(function()
                return loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/UiLibraries-lua_u/libraries/Files%20Folder/ShamanUi.lua';}).Body)()

                --- TEST
                --- return loadstring(request({Url = 'https://raw.githubusercontent.com/DexxterGWM/UiLibraries-lua_u/libraries/Files%20Folder/Tests/ShamanUi.lua';}).Body)()
        end, function(Err)
                warn(':: Dexxter :: ?~ LOADER: ERROR: failed while requesting <module> 3:', Err)
        end)

        if _S and 'table' == type(GuiLibrary) then
        else
                warn(':: Dexxter :: ?~ LOADER: ERROR: <module> 3 request failed.') ---
                return
        end
        if _DEBUG then warn(':: Dexxter :: !~ LOADER: <module> 3 loaded.') end

        local LoginWindow = GuiLibrary:Window({
                Text = 'Script loader';
                Images = {Image = 'rbxassetid://138677317526548'; HoverImage = 'rbxassetid://99948234050445'; PressedImage = 'rbxassetid://111976017507856';};
                Callback = function()
                        _LOCALCRYPT = {}
                        _PELICAN = {}
                end;
        })

        local LoginTab = LoginWindow:Tab({Text = 'LOGIN';})

        LoginSection            = LoginTab:Section({    Text = 'Login section';                 OpenSection = true;                     })
        InfoDiscordSection      = LoginTab:Section({    Text = 'Blue app server section';       OpenSection = true;     Side = 'Right'; })

        LoginTab:Select()
end

do
        do
                -- LOCAL FUNCTION

                --- login key related local functions

                local key_link = function()
                        pcall(function() local Link = _PELICAN.l(); if Link then setclipboard(Link) end end)
                end

                ---@param Reference <string>
                ---@param Key <string>
                local login_key = function(Reference, Key)
                        warn('[1]', Reference, ';', Key, ';', GuiLibrary[Reference]) --- TEST

                        if GuiLibrary.Flags[Reference] == Key then
                                pcall(function() task.spawn(_PELICAN.t, Key, true) end)
                        end
                end

                -- SCRIPT FUNCTION

                --- login key related functions

                getgenv()['__key_link'] = function() task.spawn(key_link) end

                ---@param Reference <string>
                ---@param Key <string>
                getgenv()['__login_key'] = function(Reference, Key)
                        task.spawn(login_key, Reference, Key) end

                -- BUTTON

                --- login key related toggles

                LoginSection:Label({
                        Text = 'In case of bad request, please,\ninsert the key +1 time.';
                        Color = Color3.fromRGB(236, 148, 44);
                })

                LoginSection:Button({
                        Text = 'Copy free key link';
                        SubText = 'Copied!';
                        --- Tooltip = 'will copy the Dexxter\'s key link to your clipboard';
                        Callback = function() task.spawn(__key_link) end;
                })

                LoginSection:Label({
                        Text = 'Watch out for any empty\nspaces on your key text!';
                        Color = Color3.fromRGB(217, 97, 99);
                })

                LoginSection:Input({
                        Placeholder = 'Enter your key';
                        --- Tooltip = 'place your premium key or the key that you got from the website (from the "Copy key link" button)';
                        Flag = '_LoginKey';
                        Callback = function(Text) task.spawn(__login_key, '_LoginKey', Text) end;
                })

                LoginSection:Label({
                        Text = '~/Dexxter';
                        Color = Color3.fromRGB(217, 97, 99);
                })
        end

        do
                -- LOCAL FUNCTION

                --- informations related local functions

                local discord_link = function()
                        pcall(function() setclipboard('https://discord.gg/SAMPvwEdwZ') end)
                end

                -- SCRIPT FUNCTION

                --- informations related functions

                getgenv()['__discord_link'] = function() return task.spawn(discord_link) end

                -- BUTTON

                --- informations related toggles

                InfoDiscordSection:Label({
                        Text = 'Made and developed by:\n  - Dexxter Scripts';
                        Color = Color3.fromRGB(236, 148, 44);
                })

                InfoDiscordSection:Button({
                        Text = 'Copy server link';
                        SubText = 'Copied!';
                        --- Tooltip = 'will copy the link for the Dexxter\'s Discord server to your clipboard';
                        Callback = function() task.spawn(__discord_link) end;
                })

                InfoDiscordSection:Label({
                        Text = '~/Dexxter';
                        Color = Color3.fromRGB(217, 97, 99);
                })
        end

        warn((':: Dexxter :: !~ LOADER: loader script loaded in : %.4f second(s)'):format(tick() - LoadTime)) ---
end

setfenv(1, {})
script = __old_script