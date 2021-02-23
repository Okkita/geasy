Geasy = Geasy or {}

function Geasy.reloadGeasy()
    uninstallPackage("Geasy-Core-0.1")
    installPackage("D:/Geasy/core/build/Geasy-Core-0.1.mpackage")
    echo("DONE!\n")
end
