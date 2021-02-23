Geasy = Geasy or {}

function Geasy.reloadGeasy()
    uninstallPackage("Geasy-Core-0.1")
    installPackage("D:/Geasy/core/build/Geasy-Core-0.1.mpackage")
end

function Geasy.installMessage(_, name)
    -- stop if what got installed isn't my thing

    if not string.find(name, "Geasy") then return end

    cecho("\n\n<gold>:: Thank you for installing Geasy.\n")
    cecho("\n<gold>:: Geasy is maintained at ")
    echoLink("https://github.com/Okkita/geasy/",
             "openUrl('https://github.com/Okkita/geasy/')",
             "https://github.com/Okkita/geasy/")
end

registerAnonymousEventHandler("sysInstallPackage", "Geasy.installMessage")

