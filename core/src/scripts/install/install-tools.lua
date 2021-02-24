Geasy = Geasy or {}
Geasy.version = "0.1"

function Geasy.reloadPackage()
    Geasy.uninstall()
    cecho("<gold>:: Installing Geasy.\n")
    installPackage("D:/Geasy/core/build/Geasy-Core-" .. Geasy.version ..
                       ".mpackage")
end

function Geasy.uninstall()
    cecho("<gold>:: Un-installing Geasy.\n")
    uninstallPackage("Geasy-Core-" .. Geasy.version)
end

function Geasy.about()
    cecho("\n<gold>:: Geasy, version " .. Geasy.version .. "\n")
    cecho("<gold>:: Geasy is maintained at ")
    echoLink("https://github.com/Okkita/geasy/",
             "openUrl('https://github.com/Okkita/geasy/')",
             "https://github.com/Okkita/geasy/")
    echo("\n")
end

function Geasy.installMessage(_, name)
    if not string.find(name, "Geasy") then return end
    Geasy.about()
end

registerAnonymousEventHandler("sysInstallPackage", "Geasy.installMessage")
