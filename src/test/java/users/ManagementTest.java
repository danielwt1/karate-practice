package users;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ManagementTest {
    // se le coloca notacion test de jupiter para que corra las pruebas
    @Test
    //Metodo que permite ejecutar los test o scenarios de karate en paralelo
    void parallelTest(){
            //con .tags le digo que va a ignorar
            //COmo los reuazbles el que tiene @Create ya que no es una prueba individual con la virgulilla ~
        //le digo con outputCucumberJson en true que la salida es para cucumberJson
        Results response = Runner.path("classpath:users").outputCucumberJson(true).tags("~@ignore").parallel(4);
        generateReport(response.getReportDir());
    }

    // Para generacion reporte Cucumber
    // me envia un json y cucumber lo convierte a un html
    public static void generateReport(String karateOutputPath){
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "karate_example");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
