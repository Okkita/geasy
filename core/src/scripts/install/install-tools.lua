Geasy = Geasy or {}
Geasy.version = "0.1"

function Geasy.reloadPackage()
    Geasy.uninstall()
    cecho("<purple>:: Installing Geasy.\n")
    installPackage("D:/Geasy/core/build/Geasy-Core-" .. Geasy.version ..
                       ".mpackage")
end

function Geasy.uninstall()
    cecho("<purple>:: Un-installing Geasy.\n")
    uninstallPackage("Geasy-Core-" .. Geasy.version)
end

function Geasy.about()
    cecho("\n<purple>:: Geasy, version " .. Geasy.version .. "\n")
    cecho("<purple>:: Geasy is maintained at ")
    echoLink("https://github.com/Okkita/geasy/\n",
             "openUrl('https://github.com/Okkita/geasy/')",
             "https://github.com/Okkita/geasy/")
    cecho("<purple>:: '")
    echoLink("ghelp", [[Geasy.help()]], "ghelp")
    cecho("' <purple>for script commands\n")
end

function Geasy.installMessage(_, name)
    if not string.find(name, "Geasy") then return end
    Geasy.about()
end

function Geasy.help()
    cecho("<purple>" .. [[

    Geasy commands:
    ghelp - this help file
    gabout - info about this package

    <purple>Debug:
    gmcp - shows the gmcp data table

    <red>Danger zone:
    guninstall confirm - uninstalls this package

]])
end

registerAnonymousEventHandler("sysInstallPackage", "Geasy.installMessage")
