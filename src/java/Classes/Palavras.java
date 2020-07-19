package Classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Thiago
 */
public class Palavras {

    public String getDica() {
        return dica;
    }

    public void setDica(String dica) {
        this.dica = dica;
    }

    public String getPalavra() {
        return palavra;
    }

    public void setPalavra(String palavra) {
        this.palavra = palavra;
    }

    private String dica, palavra;

    public boolean gravarPalavra() {
        boolean gravou = false;

        //conectar no banco
        BancoModels bd = new BancoModels();

        if (bd.conectar()) {
            String sql = "INSERT INTO public.\"Palavras\" (palavra, dica) "
                    + "VALUES (?,?);";
            try {

                PreparedStatement ps = bd.prepararStatment(sql);

                bd.prepararString(ps, 1, palavra.toLowerCase());
                bd.prepararString(ps, 2, dica);

                bd.executarPreparedStatment(ps);
                bd.desconectar();

                gravou = true;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return gravou;
    }

    public ArrayList<Palavras> buscarPalavras() {
        ArrayList<Palavras> listaPalavra = new ArrayList();

        BancoModels bd = new BancoModels();
        if (bd.conectar()) {
            String sql = "SELECT dica, palavra from public.\"Palavras\" order by random() LIMIT 7";
            try {
                ResultSet rs = bd.consultar(sql);
                while (rs.next()) {
                    Palavras p = new Palavras();
                    p.setPalavra(rs.getString("palavra").toLowerCase());
                    p.setDica(rs.getString("dica"));
                    listaPalavra.add(p);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return listaPalavra;
    }

}
