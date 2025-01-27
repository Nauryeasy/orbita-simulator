import QtQuick.Dialogs 1.3

FileDialog {
    id: simulationPath
    title: 'Выберите папку с симулятором'
    selectFolder: true
    width: 264
    height: 146
    visible: false
    folder: folderSimulation
    onAccepted: {
        folderSimulation = simulationPath.folder.toString()
        if (folderSimulation.startsWith("file://")) {
        folderSimulation = folderSimulation.substring(7)
        }
        if (settingsManager.checkSimulationFile(folderSimulation + "/simulation.py")) {
            if (typeMission) {
                settingsManager.setSimulationPath(folderSimulation);
                settingsManager.setDevicesPath(folderSimulation + "/devices-ru.xml");
                settingsManager.setPlanetsPath(folderSimulation + "/planets.xml");
                planetsItems.loadPlanets(settingsManager.getPlanetsPath());
                planetDevicesItems.loadDevices(settingsManager.getDevicesPath());
            } else {
                settingsManager.setEarthSimulationPath(folderSimulation);
                settingsManager.setEarthSystemsPath(folderSimulation + "/devices-ru.xml");
                settingsManager.setMissionsPath(folderSimulation + "/missions-ru.xml");
                earthMissions.loadMissions(settingsManager.getMissionsPath());
            }

            settingsFolderSimulation = folderSimulation

        } else {
            errorDialog.textOfError = "В данной директории отсутствуют файлы симулятора."
            errorDialog.open()
            folderSimulation = ""
        }
    }
}
