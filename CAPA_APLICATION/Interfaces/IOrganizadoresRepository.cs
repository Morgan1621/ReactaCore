using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IOrganizadoresRepository
    {
        Task<IEnumerable<Organizadores>> ListarOrganizadoresAsync();

        Task<IEnumerable<Organizadores>> ListarOrganizadoresPorNombreAsync();
        Task NuevoOrganizadoresAsync(Organizadores organizadores);
        Task EditarOrganizadoresAsync(Organizadores organizadores);

        Task EliminarOrganizadoresEstadoAsync(int Id);



    }
}
