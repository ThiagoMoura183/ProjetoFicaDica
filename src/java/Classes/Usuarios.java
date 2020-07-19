package Classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Thiago
 */
public class Usuarios {

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getPontos() {
        return pontos;
    }

    public void setPontos(int pontos) {
        this.pontos = pontos;
    }

    private int id;
    private String nome, senha;
    private int pontos;

    public boolean consultarUsuario() {
        boolean consultou = false;

        BancoModels bd = new BancoModels();
        if (bd.conectar()) {
            String sql = "SELECT id, pontos from public.\"Usuarios\" where nome='" + this.getNome() + "' and senha='" + getSenha() + "';";
            try {
                ResultSet rs = bd.consultar(sql);
                if (rs.next()) {
                    this.setId(rs.getInt("id"));
                    this.setPontos(rs.getInt("pontos"));
                    consultou = true;
                }
                bd.desconectar();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return consultou;
    }

    public void adicionarUser() {
        BancoModels bd = new BancoModels();
        if (bd.conectar()) {
            String sql = "INSERT INTO public.\"Usuarios\" (nome, senha, pontos) VALUES (?, ?, ?)";
            try {
                PreparedStatement ps = bd.prepararStatment(sql);
                bd.prepararString(ps, 1, getNome());
                bd.prepararString(ps, 2, getSenha());
                bd.prepararInt(ps, 3, 0);
                bd.executarPreparedStatment(ps);
                bd.desconectar();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public ArrayList<Usuarios> buscarClassificacao() {
        ArrayList<Usuarios> listaUsuarios = new ArrayList();

        BancoModels bd = new BancoModels();
        if (bd.conectar()) {
            String sql = "SELECT nome, pontos from public.\"Usuarios\" order by pontos DESC";
            try {
                ResultSet rs = bd.consultar(sql);
                while (rs.next()) {
                    Usuarios u = new Usuarios();
                    u.setNome(rs.getString("nome"));
                    u.setPontos(rs.getInt("pontos"));
                    listaUsuarios.add(u);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return listaUsuarios;
    }

    public void atualizarPontos() {

        BancoModels bd = new BancoModels();
        if (bd.conectar()) {
            String sql = "UPDATE public.\"Usuarios\" SET pontos = ? where id = ?";
            try {
                PreparedStatement ps = bd.prepararStatment(sql);
                bd.prepararInt(ps, 1, getPontos());
                bd.prepararInt(ps, 2, getId());
                bd.executarPreparedStatment(ps);
                bd.desconectar();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
