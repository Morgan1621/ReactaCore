using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface IEventoPonenteRepository
    {
        Task<IEnumerable<EventoPonente>> ListarEventoPONENTEAsync();

        Task<IEnumerable<EventoPonente>> ListarEventoPONENTEPorNombreAsync();
        Task NuevoEventoponenteAsync(EventoPonente eventoPonente);
        Task EditarEventoponenteAsync(EventoPonente eventoPonente);

        Task EliminarEventoponenteAsync(int Id);



    }
}
