package api.petstore;

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

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ManagementTests {

    private static final String KARATE_OUTPUT_PATH = "build/karate-reports";

    @Test
    void testAllParallel() {
        Results results = Runner.path("classpath:")
                .outputCucumberJson(true)
                .reportDir(KARATE_OUTPUT_PATH)
                .parallel(5);
        generateReport(KARATE_OUTPUT_PATH);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);

        if (jsonFiles.isEmpty()) {
            System.err.println("❌ ERROR: No se encontraron archivos JSON de Cucumber en: " + karateOutputPath);
            throw new net.masterthought.cucumber.ValidationException("None report file was added!");
        }

        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));

        Configuration config = new Configuration(new File("build"), "test-petstore");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();

        System.out.println("✅ Reporte HTML generado exitosamente en 'build/index.html'");
    }

}
