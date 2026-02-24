using CAPA_DOMAIN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Interfaces
{
    public interface INotificacionesRepository
    {
        Task<IEnumerable<Notificaciones>> ListarnotificacionAsync();

        Task<IEnumerable<Notificaciones>> ListarnotificacionPorNombreAsync();
        Task NuevonotificacionAsync(Notificaciones notificaciones);
        Task EditarnotificacionAsync(Notificaciones notificaciones);

        Task EliminarnotificacionAsync(int Id);



    }
}
