import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.*;


// compilar: javac -cp .:../lib/barbecue-1.5-beta1.jar:../lib/commons-beanutils-1.7.jar:../lib/commons-collections-2.1.jar:../lib/commons-logging-1.1.jar:../lib/iReport.jar:../lib/itext-2.1.0.jar:../lib/jasperreports-3.5.0.jar:../lib/jcommon-1.0.15.jar:../lib/jdt-compiler-3.1.1.jar:../lib/jfreechart-1.0.12.jar:../lib/log4j-1.2.9.jar:../lib/poi-3.2-FINAL-20081019.jar:../lib/postgresql-8.1-405.jdbc3.jar:../lib/xalan.jar JasperReports.java
// executar: java -cp .:../lib/barbecue-1.5-beta1.jar:../lib/commons-beanutils-1.7.jar:../lib/commons-collections-2.1.jar:../lib/commons-logging-1.1.jar:../lib/iReport.jar:../lib/iText-2.1.0.jar:../lib/jasperreports-3.5.0.jar:../lib/jcommon-1.0.15.jar:../lib/jdt-compiler-3.1.1.jar:../lib/jfreechart-1.0.12.jar:../lib/log4j-1.2.9.jar:../lib/poi-3.2-FINAL-20081019.jar:../lib/postgresql-8.1-405.jdbc3.jar:../lib/xalan.jar JasperReports -pusername=facilitador -ppassword=facilitador -phost=localhost -pdatabase=facilitador_development -pnome_relatorio=LandscapeReport


public class JasperReports {

    public static void main(String...args) {

        String chave = "";
        String valor = "";
        int indice = 0;
        Map params = new HashMap();

        for (String arg : args) {
            if (arg.startsWith("-p")) {
                arg = arg.substring(2);
                indice = arg.indexOf("=");

                try {
                    chave = arg.substring(0, indice);
                    valor = arg.substring(indice + 1);
                    params.put(chave, valor);
                } catch (Exception e) {
                    System.out.println("!!!! Ignorando o parametro: " + arg + "\n" + e.getMessage());
                }
            }
        }

        try {
            Connection con;
            String userName = params.get("username").toString();
            String password = params.get("password").toString();
            String host = params.get("host").toString();
            String url = "jdbc:postgresql://" + host + ":5432/" + params.get("database").toString();

            Class.forName("org.postgresql.Driver").newInstance();

            con = DriverManager.getConnection(url, userName, password);
            String path = new File(".").getCanonicalPath();
//            path += "/../../../app/reports"; necessario descomentar para rodar a partir da linha de comando            

            JasperRunManager.runReportToPdfFile(path + "/app/reports/" + params.get("nome_relatorio") + ".jasper", path + "/tmp/reports/" + params.get("nome_arquivo") + ".pdf", params, con);

        } catch (Exception e) {
            System.out.println("erro ao carregar o relatorio " + params.get("nome_relatorio") + ": " + e.getMessage());
            e.printStackTrace();
        }
    }
}
