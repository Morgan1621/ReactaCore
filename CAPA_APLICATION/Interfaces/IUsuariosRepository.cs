using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IUsuariosRepository
    {

        Task<IEnumerable<Usuarios>> ListarUsuarioAsync();

        Task<IEnumerable<Usuarios>> ListarUsuarioPorNombreAsync();
        Task NuevoUsuarioAsync(Usuarios usuarios);
        Task EditarUsuarioAsync(Usuarios usuarios);

        Task EliminarUsuarioAsync(int Id);
    }
}
