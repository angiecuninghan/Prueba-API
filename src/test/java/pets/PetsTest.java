package pets;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;


public class PetsTest {
    @Test
    void testAllParallel() {
        Results results = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .parallel(4);


        //Se valida si se tienen test fallidos
        if (results.getFailCount() == 0) {
            generateReport(results.getReportDir());
        } else {
            System.out.println("Hay tests fallidos, no se genera reporte Cucumber");
        }

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {

        File reportDir = new File(karateOutputPath);

        List<String> jsonFiles = new ArrayList<>();

        File[] files = reportDir.listFiles((dir, name) -> name.endsWith(".json"));

        for (File file : files) {
            jsonFiles.add(file.getAbsolutePath());
        }

        Configuration config = new Configuration(reportDir, "PetStore Reporte");

        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);

        reportBuilder.generateReports();

        //Imprimir link de reporte cucumber en la consola

        String cucumberReportPath = karateOutputPath + "/cucumber-html-reports/overview-features.html";
        System.out.println("Reporte Cucumber:");
        System.out.println("file:///" + new File(cucumberReportPath).getAbsolutePath());


    }

}
