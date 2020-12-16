public class NextgenServiceImpl implements NextgenService {
  public NextgenWrapper getNextgenDetailsById(String nextgenId) {
    if (String.isBlank(nextGenId)) {
      throw new NoDataFoundException('ID can\'t be null or empty');
    }

    try {
      Integer recordId = Integer.valueOf(nextgenId);
      if (recordId < 1 || recordId > 9999999) {
        throw new NoDataFoundException('ID is invalid');
      }
      NextgenWrapper wrapper = new NextgenWrapper();
      wrapper.Id = nextgenId;
      wrapper.name = 'PA-10001';
      wrapper.isApproved = true;
      return wrapper;
    } catch (Exception exp) {
      throw new NoDataFoundException('ID is invalid');
    }
  }

  public void saveNextgenRecord(NextgenWrapper nextgenWrapper) {
    if (nextgenWrapper == null) {
      throw new NoDataFoundException('Invalid Details');
    }

    if (String.isNotBlank(nextgenWrapper.Id)) {
      //throw an exception
    }
  }

  public void updateNextgenRecord(NextgenWrapper nextgenWrapper) {
    if (nextgenWrapper == null) {
      throw new NoDataFoundException('ID is invalid');
    }

    if (String.isBlank(nextgenWrapper.Id)) {
      throw new NoDataFoundException('ID is invalid');
    }
  }

  public void deleteNextgenRecord(String nextgenId) {
    if (String.isBlank(NextgenId)) {
      throw new NoDataFoundException('ID is invalid');
    }
  }
}