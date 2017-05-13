package check;
import java.io.File;
import java.io.IOException;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.servlet.ServletUtilities;
public class JfreeChartUtilities extends ServletUtilities {
    public static String saveChartAsPNG(JFreeChart chart, int width,
            int height, HttpServletRequest request) throws IOException {
        if (chart == null) {
            throw new IllegalArgumentException("Null 'chart' argument.");
        }
 
        String prefix = ServletUtilities.getTempFilePrefix();
        if (request.getSession() == null) {
            prefix = ServletUtilities.getTempOneTimeFilePrefix();
        }
        prefix = prefix.replaceAll("jfreechart", "chart");
        @SuppressWarnings("deprecation")
		File tempFile = File.createTempFile(prefix, ".jpeg", new File(request.getRealPath("images")));
 
        ChartUtilities.saveChartAsJPEG(tempFile, chart, width, height);
        if (request.getSession() != null) {
            ServletUtilities.registerChartForDeletion(tempFile, request.getSession());
        }
        return tempFile.getName();
    }

}
