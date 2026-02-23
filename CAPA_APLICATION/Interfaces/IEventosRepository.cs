using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IEventosRepository
    {

        Task<IEnumerable<Eventos>> ListarEventosAsync();

        Task<IEnumerable<Eventos>> ListarEventosPorNombreAsync();
        Task NuevoEventosAsync(Eventos eventos);
        Task EditarEventosAsync(Eventos eventos);

        Task EliminarEventosAsync(int Id);

    }
}
