using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IRolesRepository
    {

        Task<IEnumerable<Roles>> ListarEstadoAsync();

        Task<IEnumerable<Roles>> ListarRolesPorNombreAsync();
        Task NuevoRolesAsync(Roles roles);
        Task EditarRolesAsync(Roles roles);

        Task EliminarRolesAsync(int Id);
    }
}
